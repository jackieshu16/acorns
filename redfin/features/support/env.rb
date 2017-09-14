require 'selenium-webdriver'
require './features/step_definitions/redfin_page_object.rb'
require 'test/unit/assertions'
require 'test/unit/testcase'
require 'test/unit'

include Test::Unit::Assertions

####global variable
driver = Selenium::WebDriver.for :firefox
my_page_object = SignInPage.new(driver)
wait = Selenium::WebDriver::Wait.new(:timeout => 5)

After do
  driver.quit()
end
