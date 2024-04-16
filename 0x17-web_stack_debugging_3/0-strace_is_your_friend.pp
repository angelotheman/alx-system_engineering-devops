# This is to fix the apache error


file { '/tmp/fix-script.sh':
  ensure  => 'file',
  owner   => 'root',
  group   => 'root',
  mode    => '0755',
  content => "#!/bin/bash\n\n# Replace 'old_string' with 'new_string' in the configuration file\n# sed -i 's/old_string/new_string/g' /path/to/config/file\n\n# Restart Apache\nsystemctl restart apache2\n",
}


exec { 'fix-apache-error':
  command     => '/tmp/fix-script.sh',
  refreshonly => true,
}

