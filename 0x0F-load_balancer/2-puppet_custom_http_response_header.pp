# Puppet manifestations to configure Nginx with custom HTTP response header

# Install Nginx
package {'nginx':
  ensure  => installed,
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
  require => Package['nginx'],
}

# Execute command to restart Nginx
exec { 'nginx_restart':
  command     => 'service nginx restart',
  path        => '/usr/sbin:/usr/bin:/sbin:/bin',
  refreshonly => true,
}
