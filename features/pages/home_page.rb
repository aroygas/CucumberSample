#
# Home page is the only one actual Page used in this small exercise.
#
class HomePage < GenericPage
  #Set current page url parameter to one that is get from settings yml file
  page_url Common.get_url('home_page')

  #Search input element in the page header
  text_field(:search, :name => 'query')

  #Search button.
  button(:search_button, :type => 'submit')

  #
  # Search for something using search input in the header.
  #
  # @param [String] query
  #
  def search_for(query)
    self.search = query
    self.search_button
  end

  #
  # Switch to homepage to work with it's content.
  #
  def switch_to_homepage
    self.browser.switch_to.default_content
  end
end