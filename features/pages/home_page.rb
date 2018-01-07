#
# Home page is the only one actual Page used in this small exercise
#
class HomePage < GenericPage

  #Set current page url parameter to one that is get from settings yml file
  page_url Common.get_url('home_page')

  #Search input element in the page header
  text_field(:search, :name => 'query')

  #Shopping cart button in the page header
  link(:cart, :class => 'b-top-navigation-cart__link')

  #A product title in search results table is a link inside iframe
  in_iframe(:index => 1) do |frame|
    link(:product_title, :class => 'product__title-link', :frame => frame)
  end

  #
  # Search for something using search input in the header
  #
  # @param [String] query
  #
  def search_for(query)
    self.search = query
  end

  #
  # Click on link with specified text
  #
  # @param [String] link_text
  #
  def follow_link_with_text(link_text)
    self.find_custom_element("//a[contains(., '#{link_text}')]").click
  end

  #
  # Table cell element that follows table cell element with specified text
  #
  # @param [String] parameter
  # @return [Element]
  #
  def parameter_element(parameter)
    self.find_custom_element("//table[@class='product-specs__table']//td[contains(., '#{parameter}')]/following-sibling::td")
  end

  #
  # Make sure that product is present in cart
  #
  # @param [String] product_name
  # @return [Element]
  #
  def product_is_in_cart(product_name)
    self.find_custom_element("//div[@class = 'cart-product-title__link cart-product-title__link_name' and contains(.,'#{product_name}')]").displayed?
  end
end