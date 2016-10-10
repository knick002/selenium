require_relative './base/base.rb'
require_relative './base/elements.rb'
require 'minitest/autorun'

MZ = MezzElements.new

class MainPage2 < SeleniumTest::Base
	def test_step1_open_page2
		url = @base_url[@server]
		open(url)
		sleep(2)
		sendKeys(MZ.getElementBy('search_box'), 'google')
		click(MZ.getElementBy('search_btn'))
		sleep(1)
		assert_equal 'goog - Google Search', getTitle # sample for failure
		assert_equal 'https://www.google.com/?gws_rd=ssl#q=google', getUrl
	end
end
