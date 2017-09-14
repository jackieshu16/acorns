#require 'selenium-webdriver'
#require './features/step_definitions/redfin_page_object.rb'
#require 'test/unit/assertions'
#require 'test/unit/testcase'
#require 'test/unit'

#include Test::Unit::Assertions

####global variable
#driver = Selenium::WebDriver.for :firefox
#my_page_object = SignInPage.new(driver)
#wait = Selenium::WebDriver::Wait.new(:timeout => 5)

####move all the line above to support/env.rb, but which opens extra browser window when run the tests

Given(/^a user opens redfin page$/) do 
  my_page_object.goto
end

Given(/^a user has valid email "([^"]*)" and password "([^"]*)"$/) do |email,password|
####click Sign In link in the uppper right corner
  my_page_object.signIn_link_element.click

####wait til the dialog show up the sign in options, click one option
#  wait = Selenium::WebDriver::Wait.new(:timeout => 5)
  cwemail = wait.until {
    element = my_page_object.continue_with_email_button_element
    element if element.exist?
   }
  cwemail.click

####provide email and password
  wait.until {
    element = my_page_object.useremail_element
    #puts "useremail exists" if element.exist?
   #my_page_object.set_email("shuzhan16@hotmail.com") if element.exist?
    my_page_object.set_email("#{email}") if element.exist?
  }

  wait.until {
    element = my_page_object.userpassword_element
    my_page_object.set_pass("#{password}") if element.exist?
  }

end

When(/^the user click sign in button$/) do
####click sign in button
  sibutton = wait.until {
    element = my_page_object.signIn_button_element
    element if element.exist?
  }
  sibutton.click

end

Then(/^login should be successful$/) do
####validate user on the logged in page
  uname = wait.until {
    element = my_page_object.username_element
    my_page_object.username if element.exist?
  }
  puts "user "+"#{uname}"+" logged in"
  assert_not_nil "#{uname}", "sign in error" 
end
