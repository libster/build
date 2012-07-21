class rvmruby() {

  notify { "This may take a while.." : }

  if $rvm_installed == "true" {
    rvm_system_ruby {
      'ruby-1.9.3-p194':
        ensure => 'present';
    }

    rvm_gem { 'rails' :
      name => 'rails',
      ruby_version => 'ruby-1.9.3-p194',
      ensure => '3.2.3',
      require => Rvm_system_ruby['ruby-1.9.3-p194'];
    }  

  }
}