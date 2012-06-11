class platform::ruby() {

  package {

    "ruby1.8":
      ensure => latest;

    # ruby 1.9.1 provides ruby 1.9.3 on ubuntu 12.04 and
    # ruby 1.9.2 on Ubuntu 11.10

    "ruby1.9.1":
      ensure => latest;

    "ruby-bundler":
      ensure => latest;
  }

  file { "/etc/alternatives/ruby":
    ensure => link,
    target => "/usr/bin/ruby1.9.1"
  }

  #exec { "/usr/bin/gem install rails" : }
}
