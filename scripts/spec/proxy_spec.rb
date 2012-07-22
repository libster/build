require 'watir-webdriver'

describe "proxy" do

	before :all do
		@browser = Watir::Browser.new
	end

	after :all do
		@browser.close
	end


	it "gets to google.com" do
		@browser.goto 'www.google.com'
		# b.text_field(:id => 'entry_0').set 'your name'
		# b.select_list(:id => 'entry_1').select 'Ruby'
		# b.select_list(:id => 'entry_1').selected? 'Ruby'
		# b.button(:name => 'submit').click

		#b.text should_contain("Thank you")
		@browser.title.should include "Google"
		#a.should include "test"
	end

	it "gets to Friv.com" do
		@browser.goto 'www.friv.com'
		@browser.title.should include "Friv"
	end

end