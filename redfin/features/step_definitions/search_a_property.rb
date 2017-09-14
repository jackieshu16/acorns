#require 'selenium-webdriver'
#require './features/step_definitions/redfin_page_object.rb'
#require 'test/unit/assertions'
#require 'test/unit/testcase'
#require 'test/unit'

#include Test::Unit::Assertions

####global variable
#driver = Selenium::WebDriver.for :firefox
#my_page_object = SignInPage.new(driver)
#wait = Selenium::WebDriver::Wait.new(:timeout => 10)

####move all the line above to support/env.rb, but which opens extra
 browser window when run the tests

Given(/^a user provides city and state "([^"]*)"$/) do |area|
  ####search a property in an area
  my_page_object.goto

  sbox = wait.until {
    element = my_page_object.search_box_element
    element if element.exist?
  }
  my_page_object.set_search_term("#{area}")

end

When(/^the user click the search button$/) do
  my_page_object.search_button

end

Then(/^the result should return properties in the area "([^"]*)"$/) do |area|
  rsbox = wait.until {
    element = my_page_object.result_search_box_element
    my_page_object.result_search_box if element.exist?
  }
  puts "#{rsbox}"
  rheader = wait.until {
    element = my_page_object.right_header_element
    my_page_object.right_header if element.exist?
  }
  area_re = "#{area}" + " Real Estate"
  assert_equal "#{area}", "#{rsbox}"
  assert_equal "#{area_re}", "#{rheader}"
end

Given(/^search result is shown$/) do
  num = my_page_object.show_result_number
  puts "num"
end

When(/^a user click more filters button$/) do
  mfbutton = wait.until {
    element = my_page_object.more_filters_button_element
    element if element.exist?
  }
  mfbutton.click
end

When(/^add filters with the following:$/) do |table|
  table.hashes.each do |row|
    filter = row[:filter]
    value = row[:value]
   #puts "#{filter} and #{value}"

    if "#{filter}" == "minBeds" then
      minbedfilter = wait.until {
        element = my_page_object.minBeds_filter_element
        element if element.exist?
      }
      minbedfilter.click

      minbedlist = wait.until {
        element = my_page_object.minBeds_list_element 
        element if element.exist?
        puts "min bed select list exist" if element.exist?
      }
     #puts my_page_object.minBeds_list_options
      opt_minbed = my_page_object.minBeds_list
      puts "opt_minbed is #{opt_minbed}"
####below I tried more than 10 ways to select a value from the drop down, unfortunately none worked for me after I read all search results about the ruby page object select_list.
     #my_page_object.minBeds_list=/3/
     #my_page_object.minBeds_list=3
     #my_page_object.minBeds_list_element[3]
     #my_page_object.minBeds_list_element.options["3"].click
     #my_page_object.send("minBeds_list_element").select("3")
     #my_page_object.minBeds_list.option(:value => "3").click
     #my_page_object.minBeds_list_element.select_by(:value, '3')
     #minbedlist.select_by(:value, '3')
     #minbedlist.select(:value, '3')
     #minbedlist.select('3')
     #minbedlist.select
     #minbedlist.select.options[3].click
     #minbedlist.set_minBeds(3)
     #my_page_object.minBeds_filter.set_minBeds(row[:value])
      opt_minbed = my_page_object.minBeds_list
      puts "opt_minbed is #{opt_minbed}"

      my_page_object.fewer_filters_button
    end
  end
end

Then(/^the result should match the criteria$/) do
  my_page_object.table_button
####will research more on page object on table related subject
####verify data in specific columns to meet the criteria
end

