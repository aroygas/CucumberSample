case ENV['BROWSER']
  when 'chrome'
    browser = Selenium::WebDriver.for :chrome
  when 'firefox', 'ff'
    browser =Selenium::WebDriver.for :ff
  when 'edge'
    browser = Selenium::WebDriver.for :edge
  when 'opera'
    browser = Selenium::WebDriver.for :opera
  else
    browser = Selenium::WebDriver.for :chrome
end

Before '@javascript' do
  @browser = browser
  @browser.manage.window.maximize
end

#Taking screenshot in case of failure
After '@javascript' do |scenario|
  begin
    if scenario.failed?
      Dir::mkdir('screenshots') if not File.directory?('screenshots')
      screenshot = "./screenshots/FAILED_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
      @browser.save_screenshot(screenshot)
      embed screenshot, 'image/png', "[ SCREENSHOT ]"
    end
  ensure
    @browser.close
  end
end