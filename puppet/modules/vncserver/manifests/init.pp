class vncserver {
  
  package { 'vnc4server':
    ensure => installed,
  }
}
