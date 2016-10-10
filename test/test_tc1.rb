require_relative './base/base.rb'
require_relative './base/elements.rb'
require 'minitest/autorun'

MZ = MezzElements.new

class MainPage < SeleniumTest::Base


	def test_step1_open_page
		url = @base_url[@server]
		open(url)
		sleep(2)
		sendKeys(MZ.getElementBy('search_box'), 'google')
		click(MZ.getElementBy('search_btn'))
		sleep(1)
		assert_equal 'google - Google Search', getTitle
		assert_equal 'https://www.google.com/?gws_rd=ssl#q=google', getUrl
	end

end
