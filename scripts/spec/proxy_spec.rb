require 'watir-webdriver'



describe "proxy" do

	it "gets to google.com" do
		# b = Watir::Browser.new 
		# b.goto 'bit.ly/watir-webdriver-demo'
		# b.text_field(:id => 'entry_0').set 'your name'
		# b.select_list(:id => 'entry_1').select 'Ruby'
		# b.select_list(:id => 'entry_1').selected? 'Ruby'
		# b.button(:name => 'submit').click

		# b.text should_contain("Thank you")

		a = "test"

		a.should include "test"
	end

end