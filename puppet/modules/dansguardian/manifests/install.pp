class dansguardian::install {
	
	package { 'dansguardian' :
		ensure => present,
	}

	file { '/etc/dansguardian/dansguardian.conf':
	  owner   => 'root',
	  group   => 'root',
	  mode    => '0664',
	  source  => 'puppet:///modules/dansguardian/dansguardian.conf',
	  require => Package['dansguardian'],
	}

	file { '/var/log/dansguardian/access.log':
	  owner   => 'root',
	  group   => 'root',
	  mode    => '0666',
	  source  => 'puppet:///modules/dansguardian/access.log',
	  require => Package['dansguardian']
	}
}