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

  #
  # Search for something using search input in the header.
  #
  # @param [String] query
  #
  def search_for(query)
    self.search = query
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
  # Click on link with product title in search results.
  #
  # @param [String] product_title
  #
  def open_product_with_title(product_title)
    self.find_custom_element("//a[@class='product__title-link' and contains(., '#{product_title}')]").click
  end

  #
  # Table cell element that follows table cell element with specified text.
  #
  # @param [String] parameter
  # @return [Element]
  #
  def parameter_element(parameter)
    self.find_custom_element("//table[@class='product-specs__table']//td[contains(., '#{parameter}')]/following-sibling::td")
  end

  #
  # Make sure that product is present in cart.
  #
  # @param [String] product_name
  # @return [Element]
  #
  def product_is_in_cart(product_name)
    self.find_custom_element("//div[@class = 'cart-product-title__link cart-product-title__link_name' and contains(.,'#{product_name}')]").displayed?
  end

  #
  # Switch to iframe to work with it's content.
  #
  def switch_to_search_iframe
    frame = self.find_custom_element("//iframe[@class='modal-iframe']")
    self.browser.switch_to.frame(frame)
  end

  #
  # Switch to homepage to work with it's content.
  #
  def switch_to_homepage
    self.browser.switch_to.default_content
  end
end