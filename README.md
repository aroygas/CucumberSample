# CucumberSample
An exercise of UI testing automation using Ruby and Cucumber.

# Instructions to use
## 1. Checkout project: 

`git clone https://github.com/aroygas/CucumberSample`

## 2. Install dependencies:

`bundle install`

## 3. Run tests:
### a) Smoke scenario that should pass

`bundle exec cucumber`

### b) Debug scenarios that should fail and show pretty screenshots in the html report 

`bundle exec cucumber --profile debug`

## 4. HTML report:

An html report called **results.html** should be generated in root of the project if tests are ran with default or debug pofiles, or `--format html -o results.html` is added to runner options.