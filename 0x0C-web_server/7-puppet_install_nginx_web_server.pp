# Using puppet to manage my nginx configurations

# Install Nginx package
package { 'nginx':
  ensure => installed,
}

# Configure the Nginx Server
file { '/etc/nginx/sites-available/default':
  ensure  => present,
  content => "
    server {
	    listen 80;
		listen [::]:80;
		
		server_name 54.237.9.122;

		root /var/www/html;
		index index.html index.htm index.nginx-debian.html

		location / {
			return 200 'Hello World!';
		}

		location /redirect_me {
			return 301 'https://www.youtube.com/watch?v=QH2-TGUlwu4';
		}
	}
  ",
  notify   => Service['nginx'],
}

# Enable the default site
file { '/etc/nginx/sites-enabled/default':
  ensure  => link,
  target  => '/etc/nginx/sites-available/default',
  require => File['/etc/nginx/sites-available/default'],
  notify  => Service['nginx'],
}

# Ensure Nginx server is always running or restart
service { 'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'],
  notify  => Service['nginx'],
}
