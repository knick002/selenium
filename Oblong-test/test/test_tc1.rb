require_relative './base/base.rb'
require_relative './base/elements.rb'
require 'minitest/autorun'

MZ = MezzElements.new

class MainPage < SeleniumTest::Base


	def test_step1_open_page
		url = @base_url[@server]
		open(url)
		sleep(2)
		sendKeys(MZ.getElementBy('search_box'), 'nitin')
		click(MZ.getElementBy('search_btn'))
		assert_equal 'niti - Google Search', getTitle
	end

end
