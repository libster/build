class squid::service {
	
	service { 'squid3' :
		ensure => running,
		hasstatus => true,
		hasrestart => true,
		enable => true,
		require => Class['squid::install'],
	}
}