require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome
wait = Selenium::WebDriver::Wait.new(:timeout => 5) # seconds

Before '@javascript' do
  driver.manage.window.maximize
end

After '@javascript' do
  driver.quit
end

Given(/^(?:|I )am logged in to "([^"]*)"$/) do |url|
  driver.navigate.to url
end

When(/^(?:|I )search for "([^"]*)"$/) do |query|
  driver.find_element(:name, 'query').send_keys(query)
  wait.until { driver.find_element(:class, 'modal-iframe') }
  driver.switch_to().frame(1)
end

Then(/^(?:|I )should see "([^"]*)" product in search results$/) do |text|
  element = wait.until { driver.find_element(:class, 'product__title-link') }
  expect(element.text).to eq(text)
end

Then(/^(?:|I )should see "([^"]*)" text$/) do |text|
  wait.until { driver.find_element(:xpath, "//*[contains(.,'#{text}')]") }
end

When(/^(?:|I )follow to "([^"]*)"$/) do |link_text|
  driver.find_element(:link_text, link_text).click
end

Then(/^(?:|I )should see that "([^"]*)" parameter has "([^"]*)" value$/) do |parameter, value|
  element = wait.until { driver.find_element(:xpath, "//table[@class='product-specs__table']//td[contains(., '#{parameter}')]/following-sibling::td") }
  expect(element.text).to eq(value)
end

When(/^I add product to cart$/) do
  step 'I follow to "В корзину"'
end

And(/^I open shopping cart$/) do
  driver.find_element(:class, 'b-top-navigation-cart__link').click
end

Then(/^I should see "([^"]*)" in cart$/) do |product_name|
  wait.until { driver.find_element(:xpath, "//div[@class = 'cart-product-title__link cart-product-title__link_name' and contains(.,'#{product_name}')]") }
end