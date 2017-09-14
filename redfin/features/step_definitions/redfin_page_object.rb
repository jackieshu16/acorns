require 'page-object'

class SignInPage
  include PageObject

  page_url('http://redfin.com')

  link(:signIn_link, :class => %w(verticallyCenterFlexContent clickable regularLinkColor menuItemClickable menuItemAlign) )

  button(:continue_with_email_button, :class => %w(button Button  tertiary emailSignInButton v3))

  text_field(:useremail, :name => 'emailInput')

  text_field(:userpassword, :name => 'passwordInput')

  button(:signIn_button, :class => %w(button Button  primary submitButton v3))

  span(:username, :class => 'name')

  link(:signOut_link, :href => 'https://www.redfin.com/stingray/do/logout')

  text_field(:search_box, :id => 'search-box-input')

  button(:search_button, :title => 'Search')

  text_field(:result_search_box, :id => 'search-box-input')

  div(:right_header, :class => 'headerContainer')

  button(:more_filters_button, :class => %w(button Button  wideSidepaneFilterButton v3 compact text))

  button(:fewer_filters_button, :class => %w(button Button  wideSidepaneFilterButton v3 compact text))

  span(:minBeds_filter, :class => %w(field select Select clickable minBeds))
 #select_list(:minBeds_list, :name => 'minBeds')

  select_list(:minBeds_list, :css => "select.select[name='minBeds']") 

  span(:minSqft_filter, :class => %w(field select Select clickable sqftMin))
  span(:minYear_filter, :class => %w(field select Select clickable yearBuiltMin))
  span(:maxPrice_filter, :class => %w(field select Select clickable quickMaxPrice))
  select_list(:maxPrice_list, :css => "select.select[name='maxPrice']")


  button(:table_button, :class => %w(ModeOption button-text))

  div(:show_result_number, :class => %w(homes summary))

  def set_email(uemail)
    self.useremail = uemail
  end

  def set_pass(upass)
    self.userpassword = upass
  end

  def set_search_term(sTerm)
    self.search_box = sTerm
  end
 
end

