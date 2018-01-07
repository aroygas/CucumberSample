#Timout for waiting of search results
timeout = 10

Given(/^(?:|I )am on the home page$/) do
  visit_page HomePage
end

When(/^(?:|I )search for "([^"]*)"$/) do |query|
  @current_page.search_for query
end

Then(/^(?:|I )should see "([^"]*)" product in search results$/) do |text|
  expect(@current_page.product_title_element.when_present(timeout).text).to eq text
end

Then(/^(?:|I )should see "([^"]*)" text$/) do |text|
  @current_page.text_is_on_page text
end

When(/^(?:|I )follow to "([^"]*)"$/) do |link_text|
  @current_page.follow_link_with_text(link_text)
end

Then(/^(?:|I )should see that "([^"]*)" parameter has "([^"]*)" value$/) do |parameter, value|
  expect(@current_page.parameter_element(parameter).text).to eq(value)
end

When(/^I add product to cart$/) do
  step 'I follow to "В корзину"'
end

And(/^I open shopping cart$/) do
  @current_page.cart
end

Then(/^I should see "([^"]*)" in cart$/) do |product_name|
  @current_page.product_is_in_cart(product_name)
end