Given(/^(?:|I )am on the home page$/) do
  visit_page HomePage
end

Then(/^(?:|I )should see text "([^"]*)"$/) do |text|
  @current_page.text_is_on_page text
end

When(/^(?:|I )follow to "([^"]*)"$/) do |link_text|
  @current_page.link_with_text(link_text).click
end

#Search steps

When(/^(?:|I )search for "([^"]*)"$/) do |query|
  @current_page.search_for query
end

Then(/^(?:|I )should see "([^"]*)" product in search results(?:| in (-?\d+) second(?:|s))$/) do |text, seconds|
  if seconds.zero?
    local_timeout = WAITING_TIMEOUT
  else
    local_timeout = seconds
  end
  @current_page.switch_to_search_iframe
  expect(@current_page.product_title_element.when_present(local_timeout).text).to eq text
  @current_page.switch_to_homepage
end

When(/^(?:|I )find "([^"]*)" product$/) do |query|
  step %{I search for "#{query}"}
  step %{I should see "#{query}" product in search results}
end

When(/^(?:|I )open "([^"]*)" product$/) do |product_name|
  @current_page.switch_to_search_iframe
  @current_page.open_product_with_title(product_name)
  @current_page.switch_to_homepage
  expect(@current_page.product_head_title_element.when_present(WAITING_TIMEOUT).text).to include product_name
end

Then(/^(?:|I )should see that "([^"]*)" parameter has "([^"]*)" value$/) do |parameter, value|
  expect(@current_page.parameter_element(parameter).text.strip).to eq value.strip
end

Then(/^(?:|I )should see that parameters have values:$/) do |table|
  data = table.hashes
  data.each do |row|
    step %{should see that "#{row['Parameter']}" parameter has "#{row['Value']}" value}
  end
end

#Cart steps

When(/^(?:|I )add product to cart$/) do
  @current_page.cart_element.when_present(WAITING_TIMEOUT)
  step %{I follow to "В корзину"}
end

And(/^(?:|I )open shopping cart$/) do
  @current_page.cart
end

Then(/^(?:|I )should see "([^"]*)" in cart$/) do |product_name|
  @current_page.product_is_in_cart(product_name)
end