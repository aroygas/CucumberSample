#Timeout for waiting of search results
timeout = 10

Given(/^(?:|I )am on the home page$/) do
  visit_page HomePage
end

Then(/^(?:|I )should see text "([^"]*)"$/) do |text|
  @current_page.text_is_on_page text
end

When(/^(?:|I )follow to "([^"]*)"$/) do |link_text|
  @current_page.follow_link_with_text(link_text)
end

#Search steps

When(/^(?:|I )search for "([^"]*)"$/) do |query|
  @current_page.search_for query
end

Then(/^(?:|I )should see "([^"]*)" product in search results$/) do |text|
  expect(@current_page.product_title_element.when_present(timeout).text).to eq text
end

When(/^(?:|I )find "([^"]*)" product$/) do |query|
  step %{I search for "#{query}"}
  step %{I should see "#{query}" product in search results}
end

When(/^(?:|I )open "([^"]*)" product$/) do |query|
  step %{I follow to "#{query}"}
  expect(@current_page.product_head_title_element.when_present(timeout).text).to include query
end

Then(/^(?:|I )should see that "([^"]*)" parameter has "([^"]*)" value$/) do |parameter, value|
  expect(@current_page.parameter_element(parameter).text).to eq(value)
end

Then(/^(?:|I )should see that parameters have values:$/) do |table|
  data = table.hashes
  data.each do |row|
    step %{should see that "#{row['Parameter']}" parameter has "#{row['Value']}" value}
  end
end

#Cart steps

When(/^(?:|I ) add product to cart$/) do
  step %{I follow to "В корзину"}
end

And(/^(?:|I ) open shopping cart$/) do
  @current_page.cart
end

Then(/^(?:|I ) should see "([^"]*)" in cart$/) do |product_name|
  @current_page.product_is_in_cart(product_name)
end