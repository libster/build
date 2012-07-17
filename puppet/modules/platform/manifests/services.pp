class platform::services {
	
  #package {'curl':
  #	ensure => installed;
  #}

  package { 'sshd':
  	ensure => present,
  	name   => 'openssh-server',
  }
  	
}