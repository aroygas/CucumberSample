Feature: Search for host
  In order to find some place to live
  As a user
  I need be able to search for some hosts on airbnb

  @smoke
  @javascript
  Scenario: Search for host in San Francisco
    Given I am on the home page
    When I search for "San Francisco"
    Then I should see text "Explore San Francisco"

#Negative search
  @javascript
  @debug
  Scenario: Just try to fail in order to show a pretty screenshot in test report
    Given I am on the home page
    When I search for "New York"
    Then I should see text "Explore Los Angeles"