# This is to fix the apache error

$script_content = "
#!/bin/bash

# Replace 'old_string' with 'new_string' in the configuration file
# sed -i 's/old_string/new_string/g' /path/to/config/file

# Restart Apache
systemctl restart apache2
"

file { '/tmp/fix-script.sh':
  ensure  => 'file',
  owner   => 'root',
  group   => 'root',
  mode    => '0755',
  content => $script_content,
}

exec { 'fix-apache-error':
  command     => '/tmp/fix-script.sh',
  refreshonly => true,
}

