class platform::ruby() {

  ## archive once RVM is settled


  package { "ruby1.8":
      ensure => latest;
  }


    # ruby 1.9.1 provides ruby 1.9.3 on ubuntu 12.04 and
    # ruby 1.9.2 on Ubuntu 11.10

  package { "ruby1.9.1" :
      ensure => latest,
      require => Package["ruby1.8"]
  }

  package { "ruby-bundler" :
      ensure => latest,
      require => Package["ruby1.9.1"]
  }

  file { "/etc/alternatives/ruby":
    ensure => link,
    target => "/usr/bin/ruby1.9.1",
    require => Package["ruby-bundler"]
  }


  package {
    "ruby1.9.1-dev":
      ensure => latest;
    "libxml2-dev" :
      ensure => latest;
    "libxslt1-dev" :
      ensure => latest;
    "libsqlite3-dev" :
      ensure => latest;
  }



  #exec { "/usr/bin/gem install rails" : }
}
