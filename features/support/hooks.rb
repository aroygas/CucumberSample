Before '@javascript' do
  @browser = Selenium::WebDriver.for :chrome
  @browser.manage.window.maximize
end

After '@javascript' do
  @browser.quit
end