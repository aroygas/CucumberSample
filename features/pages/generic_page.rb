#
# A top level Page that is a parent for other Pages.
# It should implement basic methods that can be useful on any page.
#
class GenericPage
  #PageObject is used for operating with standard elements, Common module is used to pass settings
  include PageObject, Common

  #
  # Make sure that text is present on the page.
  # If text needed is not found during timeout, a meaningful error message will be shown and an exception will be thrown.
  #
  # @param [String] text
  # @param [Integer] timeout
  #
  def text_is_on_page(text, timeout = WAITING_TIMEOUT)
    self.wait_until(timeout, "\n\nERROR! Text '#{text}' was not found after #{timeout} seconds of waiting!\n") do
      self.text.include? text
    end
  end

  #
  # Find custom element by xpath.
  # Method will wait for element to be present first.
  # If element is not found during timeout, a meaningful error message will be shown and an exception will be thrown.
  #
  # @param [String] xpath
  # @param [Integer] timeout
  #
  # @return [Element]
  #
  def find_custom_element(xpath, timeout = WAITING_TIMEOUT)
    wait = Selenium::WebDriver::Wait.new(:timeout => timeout, :message => "\n\nERROR! Element with xpath: '#{xpath}' was not found after #{timeout} seconds of waiting!\n\n")
    custom_element = HomePage::Elements
    wait.until {
      custom_element = find_element(:xpath, xpath)
      custom_element.displayed?
    }
    custom_element
  end
end