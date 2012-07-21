class platform::installrvm {

	$user_array = split($users, ',')
	
  	include rvm

  	define add_rvm_user() {
		rvm::system_user { $name : ;}
		#notify { $name : ;}
  	}

	add_rvm_user { $user_array : ;}
}