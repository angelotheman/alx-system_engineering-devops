# Configuration with puppet

$ssh_config_content = "
    # SSH client Configuration
    Host 54.237.9.122
        IdentityFile ~/.ssh/school
	PasswordAuthentication no
"

file {"etc/ssh/ssh_config":
  ensure  => present,
  content => $ssh_config_content,
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
}
