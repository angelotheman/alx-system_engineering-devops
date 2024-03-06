# Puppet manifestations to configure Nginx with custom HTTP response header

# Update package
package {'update':
  ensure => latest,
}

# Install Nginx
package {'nginx':
  ensure  => installed,
  require => Package['update'],
}

# Create index.html file
file {'/var/www/html/index.html':
  ensure  => present,
  content => 'Hello World!',
}

# Create 404.html
file {'/var/www/html/404.html':
  ensure  => present,
  content => "Ceci n'est pas une page",
}

# Configure Nginx with custom HTTP header
file {'/etc/nginx/sites-available/default':
  ensure  => present,
  content => "
        server {
          listen 80;
          listen [::]:80;
          add_header X-Served-By $::hostname;

          root /var/www/html;
          index index.html index.htm index.nginx-debian.html;

          location = /redirect_me {
            return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4/;
          }

          error_page 404 /404.html;
          location /404 {
            root /var/www/html;
            internal;
          }
        }",
  require => Package['nginx'],
  notify  => Service['nginx'],
}

# Define the Nginx Service
service {'nginx':
  ensure => running,
  enable => true,
}
