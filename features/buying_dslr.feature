Feature: Buy something in online shop
  In order to buy something online
  As a user
  I need be able to go to online shop, search for some product and add it to a shopping cart

  @smoke
  @javascript
  Scenario: Buy Canon EOS 1300D in online shop
    Given I am on the home page
    When I find "Canon EOS 1300D Body" product
    And open "Canon EOS 1300D Body" product
    Then I should see that parameters have values:
    |Parameter                |Value           |
    |Размер экрана            |3 ''            |
    |Количество точек матрицы |18 Мп           |
    |Физический размер матрицы|APS-C (1.6 crop)|
    When I add product to cart
    And open shopping cart
    Then I should see "Canon EOS 1300D Body" in cart

  #############################################################################################################################################
  #                                                                                                                                           #
  # Following scenarios are here just to show that any parametrized step can fail with wrong values (You can checkout screenshots in reports) #
  #                                                                                                                                           #
  #############################################################################################################################################

  @debug
  @javascript
  Scenario: Search for something else
    Given I am on the home page
    When I search for "Something strange"
    Then I should see "Canon EOS 1300D Body" product in search results in 5 seconds

  @debug
  @javascript
  Scenario: Have chance to get timeout
    Given I am on the home page
    When I search for "Canon EOS 1300D Body"
    Then I should see "Canon EOS 1300D Body" product in search results in 1 second

  @debug
  @javascript
  Scenario: Expect something else
    Given I am on the home page
    When I search for "Canon EOS 1300D Body"
    Then I should see "Nikon" product in search results

  @debug
  @javascript
  Scenario: Try to open something else
    Given I am on the home page
    When I find "Canon EOS 1300D Body" product
    When I follow to "Strange link"

  @debug
  @javascript
  Scenario: Expect some other text
    Given I am on the home page
    When I find "Canon EOS 1300D Body" product
    And open "Canon EOS 1300D Body" product
    Then I should see text "Lorem Ipsum"

  @debug
  @javascript
  Scenario: Expect wrong parameter value
    Given I am on the home page
    When I find "Canon EOS 1300D Body" product
    And open "Canon EOS 1300D Body" product
    And should see that "Размер экрана" parameter has "55 ''" value

  @debug
  @javascript
  Scenario: Look for something else in the cart
    Given I am on the home page
    When I find "Canon EOS 1300D Body" product
    And open "Canon EOS 1300D Body" product
    And should see that "Размер экрана" parameter has "3 ''" value
    And should see that "Количество точек матрицы" parameter has "18 Мп" value
    And should see that "Физический размер матрицы" parameter has "APS-C (1.6 crop)" value
    When I add product to cart
    And open shopping cart
    Then I should see "Sony" in cart