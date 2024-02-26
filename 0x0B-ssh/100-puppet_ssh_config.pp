# Configuration with puppet

$ssh_config_content = "\
    # SSH client Configuration
    Host *
        IdentifyFile ~/.ssh/school
	PasswordAuthentication no
"

file {'etc/ssh/ssh_config':
  ensure  => present,
  content => $ssh_config_content,
}
