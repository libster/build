class testsprep() {

  package { 'watir-webdriver':
    ensure => installed,
    provider => 'gem',    
  }

}