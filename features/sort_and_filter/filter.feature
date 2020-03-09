Feature: Filter product listing by categories or designer

  Background:
    Given I login with an existing account
    And I go to explore screen

    Scenario: Filter by designer
      When I go to "CLOTHING" category
      And I filter by "AGENT PROVOCATEUR" designer
      Then product listing is filtered by selected designer

    Scenario: Show sold out products
      When I go to designer list
      And I select "3LAB" brand
      And show sold out products
      Then list will show sold out products

    Scenario Outline: Filter by each category
      When I click on "<find_option>" option
      And I select "<first_category>", "<second_category>" and "<third_category>"
      Then product list is filtered by "<expectation>"

      Examples:
        | find_option   | first_category  | second_category | third_category | expectation    |
        | CLOTHING      | CLOTHING        | COATS           | CAPES          | Coats          |

      Examples:
        | find_option   | first_category  | second_category | third_category | expectation    |
        | BAGS          | BAGS            | CLUTCH BAGS     | BOX            | Clutch Bags    |
        | ACCESSORIES   | ACCESSORIES     | FINE JEWELRY    | EARRINGS       | Fine Jewelry   |
        | LINGERIE      | LINGERIE        | BRAS            | PUSH UP BRAS   | Bras           |
        | BEAUTY        | BEAUTY          | HAIRCARE        | HAIR COLOR     | Haircare       |
        | SPORT         | SPORT           | RUN             | JACKETS        | Run            |