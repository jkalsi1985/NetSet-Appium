Feature: Sorting products price by high to low or low to high

  Background:
    Given I login with an existing account
    And go to product listing of any brand
    And capture first product price
    When I click on sort button

    Scenario Outline: Sort product price order on product listing screen
      And I select "<sort_option>" option
      Then the product price should be sorted by <expectation>

      Examples:
        | sort_option         | expectation         |
        | PRICE - LOW TO HIGH | low to high         |

      Examples:
        | sort_option         | expectation         |
        | PRICE - HIGH TO LOW | high to low         |