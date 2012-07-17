class platform::installrvm {

  	include rvm
  	rvm::system_user { vagrant: ; }

	#exec { 'reload session' :
	    #command => 'source ~/.bashrc',
	    #path    => '/bin',
	    #require => File['/etc/dansguardian/lists/bigblacklist.tar.gz'],
	 #}
}