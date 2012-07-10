class dansguardian::service {
	
	service { 'dansguardian' :
		ensure => running,
		hasstatus => false,
		hasrestart => true,
		enable => true,
		require => Class['dansguardian::install', 'dansguardian::lists'],
	}
}