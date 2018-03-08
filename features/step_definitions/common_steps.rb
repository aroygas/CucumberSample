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

Then(/^(?:|I )should see "([^"]*)" hosts in search results(?:| in (-?\d+) second(?:|s))$/) do |text, seconds|
  if seconds.zero?
    local_timeout = WAITING_TIMEOUT
  else
    local_timeout = seconds
  end
  @current_page.switch_to_search_iframe
  expect(@current_page.product_title_element.when_present(local_timeout).text).to eq text
  @current_page.switch_to_homepage
end
