require_relative './base/base.rb'
require_relative './base/elements.rb'
require 'minitest/autorun'

MZ = MezzElements.new

class MainPage2 < SeleniumTest::Base


	def test_step1_open_page2
		url = @base_url[@server]
		open(url)
		sleep(2)
		sendKeys(MZ.getElementBy('search_box'), 'nitin')
		click(MZ.getElementBy('search_btn'))
		assert_equal 'nitin - Google Search', getTitle
	end

end
