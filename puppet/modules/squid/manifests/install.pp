class squid::install {
	
	package {'squid' :
		ensure => present,
	}

	file { '/etc/squid3/squid.conf':
	  owner   => 'root',
	  group   => 'root',
	  mode    => '0664',
	  source  => 'puppet:///modules/squid/squid.conf',
	  require => Package['squid'],
	}


}