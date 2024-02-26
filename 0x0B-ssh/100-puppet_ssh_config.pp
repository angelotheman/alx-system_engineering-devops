# Configuration with puppet

exec {'Puppet Configuration':
  path    => '/usr/bin:/bin',
  command => 'echo -e "Host 54.237.9.122\n	IdentityFile ~/.ssh/school\n	PasswordAuthentication no" >> /etc/ssh/ssh_config',
}
