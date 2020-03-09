Feature: User receive an alert when someone admires them

  Background:
    Given I register and go to feed screen
    And I go to profile screen and capture username
    When I search, admire "profile1" user and sign out

    Scenario: User A admirers user B and admire alert is shown
      And I log back with user A account
      And go to alerts screen
      Then check admire alert is displayed
      And click on alert and goes to their profile screen