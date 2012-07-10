class dansguardian::lists {

	File {
	  owner   => 'root',
	  group   => 'root',
	  mode    => '0664',		
	}

# filter lists

	file { '/etc/dansguardian/lists/bannedmimetypelist':
	  source  => 'puppet:///modules/dansguardian/lists/bannedmimetypelist',
	  require => Class['dansguardian::install'],
	}

	file { '/etc/dansguardian/lists/bannedsitelist':
	  source  => 'puppet:///modules/dansguardian/lists/bannedsitelist',
	  require => Class['dansguardian::install'],
	}

	file { '/etc/dansguardian/lists/bannedurllist':
	  source  => 'puppet:///modules/dansguardian/lists/bannedurllist',
	  require => Class['dansguardian::install'],
	}


# blacklist

	file { '/etc/dansguardian/lists/bigblacklist.tar.gz' :
	  source  => 'puppet:///modules/dansguardian/lists/bigblacklist.tar.gz',
	  require => Class['dansguardian::install'],
	}

	exec { 'untar blacklist' :
	    command => 'tar -xzvf /etc/dansguardian/lists/bigblacklist.tar.gz',
	    cwd     => '/etc/dansguardian/lists',
	    path    => '/bin',
	    require => File['/etc/dansguardian/lists/bigblacklist.tar.gz'],
    }

    exec { 'change blacklist owner' :
	    command => 'chown -R root:root blacklists',
	    cwd     => '/etc/dansguardian/lists',
	    path    => '/bin',
	    require => Exec['untar blacklist'],
    }

}