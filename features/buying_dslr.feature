Feature: Buy something in online shop
  In order to buy some stuff online
  As a user
  I need be able to go to online shop, search for some product and add it to cart

  Scenario: Buy Canon EOS 1300D in www.onliner.by
    Given I am logged in to "http:/www.onliner.by"
    When I search for "Canon EOS 1300D Body"
    Then I should see "Canon EOS 1300D Body" product in search results
    When I follow to "Canon EOS 1300D Body"
    Then I should see "Фотоаппарат Canon EOS 1300D Body" text