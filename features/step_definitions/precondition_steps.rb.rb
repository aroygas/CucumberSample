require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome
wait = Selenium::WebDriver::Wait.new(:timeout => 5) # seconds

Given(/^I am logged in to "([^"]*)"$/) do |url|
  driver.navigate.to url
end

When(/^I search for "([^"]*)"$/) do |query|
  driver.find_element(:name, 'query').send_keys(query)
  wait.until { driver.find_element(:class, 'modal-iframe') }
  driver.switch_to().frame(1)
end

Then(/^I should see "([^"]*)" product in search results$/) do |text|
  element = wait.until { driver.find_element(:class, 'product__title-link') }
  expect(element.text).to eq(text)
end

Then(/^I should see "([^"]*)" text$/) do |text|
  wait.until { driver.find_element(:xpath, "//*[contains(.,'#{text}')]") }
end

When(/^I follow to "([^"]*)"$/) do |link_text|
  driver.find_element(:link_text, link_text).click
end

