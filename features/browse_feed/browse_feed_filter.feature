Feature: Filter the content displayed on the feed either by photos, products or designers

    Scenario Outline: Filter the feed list from everything option
      Given I login with an existing account
      When I filter and apply feed by "<options>" only
      Then username is displayed

      Examples:
      |options  |
      |Photos   |
      |Products |

    Scenario: As new user, filter by you admire and message is displayed
      Given I register and go to feed screen
      When I filter and apply feed by "You Admire" only
      Then you not admiring anyone yet message is displayed

    Scenario: Admire style council, filter by you admire and style council content shows
      Given I register and go to feed screen
      When I admire Poppy Delevingne style council
      And I go to browse feed
      When I filter and apply feed by "You Admire" only
      Then only style council content is shown

    Scenario: Admire style council and products
      Given I login with an existing account
      When I filter by "Style Council" and "Products"
      Then list only shows style council with products