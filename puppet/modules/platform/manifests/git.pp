class platform::git {

  package { 'git' :
    ensure => present
  }

	# git configuration
  exec { '/usr/bin/git config --global user.name "Walt Disney"' : 
    unless => '/usr/bin/git config --global --get user.name',    
    require => Package['git']
  }
  
  exec { '/usr/bin/git config --global user.email me@mydomain.com' : 
    unless => '/usr/bin/git config --global --get user.email',
    require => Package['git']
  }

  exec { '/usr/bin/git config --global color.ui auto' :
    unless => '/usr/bin/git config --global --get color.ui',
    require => Package['git']
  }

  exec { '/usr/bin/git config --global alias.st status' :
    unless => '/usr/bin/git config --global --get alias.st',
    require => Package['git']
  }

  exec { '/usr/bin/git config --global alias.co checkout' :
    unless => '/usr/bin/git config --global --get alias.co',
    require => Package['git']
  }
}