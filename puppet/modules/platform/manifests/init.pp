class platform() {

  class { 'platform::ruby' : }

  # git configuration
  exec { '/usr/bin/git config --global color.ui auto' :
    unless => '/usr/bin/git config --global --get color.ui'
  }
  exec { '/usr/bin/git config --global color.diff auto' :
    unless => '/usr/bin/git config --global --get color.diff'
  }
  exec { '/usr/bin/git config --global color.status auto' :
    unless => '/usr/bin/git config --global --get color.status'
  }
  exec { '/usr/bin/git config --global color.branch auto' :
    unless => '/usr/bin/git config --global --get color.status'
  }
  exec { '/usr/bin/git config --global alias.st status' :
    unless => '/usr/bin/git config --global --get alias.st'
  }
  exec { '/usr/bin/git config --global alias.co checkout' :
    unless => '/usr/bin/git config --global --get alias.co'
  }

}
