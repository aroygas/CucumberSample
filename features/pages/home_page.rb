#
# Home page is the only one actual Page used in this small exercise.
#
class HomePage < GenericPage
  #Set current page url parameter to one that is get from settings yml file
  page_url Common.get_url('home_page')

  #Search input element in the page header
  text_field(:search, :name => 'query')

  #Shopping cart button in the page header
  link(:cart, :class => 'b-top-navigation-cart__link')

  #Product title in header
  h1(:product_head_title, :class => 'catalog-masthead__title')

  #A product title in search results table is a link inside iframe.
  link(:product_title, :class => 'product__title-link')

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
  # Click on link with specified text.
  #
  # @param [String] link_text
  #
  def link_with_text(link_text)
    self.find_custom_element("//a[contains(., '#{link_text}')]")
  end

  #
  # Switch to homepage to work with it's content.
  #
  def switch_to_homepage
    self.browser.switch_to.default_content
  end
end