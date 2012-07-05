class platform() {

  class { 'platform::ruby' : }

  package {'curl':
  	ensure => installed;
  }

  package { 'sshd':
  	ensure => present,
  	name   => 'openssh-server',
  }

# git configuration
  exec { '/usr/bin/git config --global user.name "Walt Disney"' : }
  
  exec { '/usr/bin/git config --global user.email me@mydomain.com' : }

  exec { '/usr/bin/git config --global color.ui auto' :
    unless => '/usr/bin/git config --global --get color.ui'
  }
  exec { '/usr/bin/git config --global alias.st status' :
    unless => '/usr/bin/git config --global --get alias.st'
  }
  exec { '/usr/bin/git config --global alias.co checkout' :
    unless => '/usr/bin/git config --global --get alias.co'
  }

}
