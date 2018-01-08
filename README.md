# CucumberSample
An exercise of UI testing automation using Ruby and Cucumber.

# Instructions to use

## 1. Checkout project: 

`git clone https://github.com/aroygas/CucumberSample`

## 2. Install dependencies:

In project workspace run

`bundle install`

## 3. Run tests:
### a) Smoke scenario that should pass

In project workspace run

`bundle exec cucumber`

### b) Debug scenarios that should fail and show pretty screenshots in the html report 

In project workspace run

`bundle exec cucumber --profile debug`

## 4. HTML report:

An html report called **results.html** should be generated in root of the project
 if tests are ran with default or debug pofiles, or `--format html -o results.html` is added to runner options.
 
 # Note 
 
 You also need to have preferred browser installed and webdriver for that driver put in ruby/bin directory (chrome is default).
 Web drivers can be found here http://www.seleniumhq.org/download/
 
 This smokes tests were successfully ran on **Chrome** and **Firefox**.
 **Microsoft Edge** has issues with getting values from fields and finding elements and is not recommended)