#!/usr/bin/ruby
require 'selenium-webdriver'
require_relative '../config/setup_helper.rb'
require_relative './elements.rb'
require 'minitest/autorun'

module SeleniumTest
	class Base  < MiniTest::Unit::TestCase
		TIMEOUT = 3
		attr_accessor :base_url
					  :server
					  :browser
					  :driver
		def setup
			read_config
			startDriver
		end

		def startDriver
			browser = ARGV[0] || @browser 
			case browser
				when 'firefox'
					profile = Selenium::WebDriver::Firefox::Profile.new
					@driver = Selenium::WebDriver.for :firefox, :profile => profile
				when 'chrome'
					profile = Selenium::WebDriver::Chrome::Profile.new
					@driver = Selenium::WebDriver.for :chrome
				when 'ie'
					@driver = Selenium::WebDriver.for :ie
			end
			return @driver
		end

		def open(url)
		    @driver.navigate.to url
		    sleep (2)
		end

		def getElement(elem_hash)
		    by = elem_hash.first.first
		    path = elem_hash[by]
		    wait = Selenium::WebDriver::Wait.new(:timeout => TIMEOUT)
		    case by
		        when "xpath"
		            return wait.until {@driver.find_element(:xpath, path)}
		        when "id"
		            return wait.until {@driver.find_element(:id, path)}
		        when "name"
		            return wait.until {@driver.find_element(:name, path)}
		        else
		            puts "By locator not defined -> " + by.to_s
		    end
		end

		def getElements(elem_hash)
		    by = elem_hash.first.first
		    path = elem_hash[by]
		    wait = Selenium::WebDriver::Wait.new(:timeout => TIMEOUT)
		    case by
		        when "xpath"
		        	return wait.until {@driver.find_elements(:xpath, path)}
		        else
		        	puts "By locator not defined -> " + by.to_s
		    end
		end

		def click(elem_hash)
		    elem = getElement(elem_hash)
		    elem.click
		end

		def sendKeys(elem_hash, text)
			elem = getElement(elem_hash)
			elem.send_keys(text)
		end

		def teardown()
			@driver.quit
		end

		def getTitle
			return @driver.title
		end

		def getUrl
			return @driver.current_url
		end

		def takeSnapshot(filename)
		    @driver.save_screenshot(filename)
		end

		def windowResize(x, y)
		    @driver.manage.window.resize_to(x, y)
		end
		    
		def fill_field(elem_hash, name)
		    elem = getElement(elem_hash)
		    elem.clear
		    sleep (1)
		    elem.send_keys(name)
		end

		def drag_and_drop(from, to)
   			@driver.action.drag_and_drop(from, to).perform
		end

		def fb_window()
			fbwinhandle = @driver.window_handles.last
			@driver.switch_to.window(fbwinhandle)
		end

	end

	def readfileUrls(myfile_path)
    	begin
		    read_file = File.open(myfile_path, 'r')
		    all_urls = []
		    IO.foreach (read_file) { |line|
		        if line.include? "http"
		            all_urls.push(line.scan(/https?:\/\/www.\S*[^",]\w/))
		        end
		    }
		    read_file.close
		    rescue Exception => e
		        puts e.message
		    end
	    return all_urls
	end
end





