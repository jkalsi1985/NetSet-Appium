Feature: Settings
  As a user, I want to change country, manage alerts and invite friends
  to use The NETSET

  Background:
    Given I login with an existing account
    And I go to profile screen

    Scenario Outline: Select each setting option
      And I click on each "<settings>" option
      Then "<screen>" is displayed

      Examples:
        | settings          | screen            |
#        | INVITE FRIENDS    | INVITE FRIENDS    |
        | COUNTRY SELECTION | COUNTRY SELECTION |
        | MANAGE ALERTS     | MANAGE ALERTS     |
        | FEEDBACK          | FEEDBACK          |
        | HELP              | HELP              |
        | CREDITS           | CREDITS           |

    Scenario: Invite friend to use The Netset via email address
      When I go to invite friends screen
      And invite friend to use netset by entering an email address
      And click on apply button
      Then compose email is displayed

    Scenario: Invite friend to use The Netset via mobile number
      When I go to invite friends screen
      And invite friend to use netset by entering mobile number
      And click on apply button
      Then SMS is displayed

    Scenario: Leave the invite friend field blank and error message is shown
      When I go to invite friends screen
      And click on apply button
      Then error message is displayed

    Scenario: Search for country that dont exist
      And I go to country selection
      When I search for "Neverland"
      Then list is empty