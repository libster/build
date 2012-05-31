class vncserver() {
  
  package { 'vnc4server':
    ensure => installed,
  }

  file { "/home/walt/.vnc":
    ensure => directory
  }

  file { "/home/walt/.vnc/xstartup":
    source => "puppet:///modules/vncserver/home/walt/.vnc/xstartup",
  }
 
  file {"/etc/init.d/startvnc.sh":
    source => "puppet:///modules/vncserver/etc/init.d/startvnc.sh",
  }

  exec { "update-rc.d startvnc.sh defaults":
    path => "/usr/sbin",
    require => File["/etc/init.d/startvnc.sh"],
  }
}
