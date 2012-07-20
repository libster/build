require 'watir-webdriver'

#b = Watir::Browser.new :firefox
b = Watir::Browser.new 
b.goto 'bit.ly/watir-webdriver-demo'
b.text_field(:id => 'entry_0').set 'your name'
b.select_list(:id => 'entry_1').select 'Ruby'
b.select_list(:id => 'entry_1').selected? 'Ruby'
b.button(:name => 'submit').click

test_status = b.text.include?("Thank you") ? "TEST PASSED" : "TEST FAILED"
p test_status

b.close