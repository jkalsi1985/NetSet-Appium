Feature: Love alert
  As a user, I should receive an alert when someone loves my photo

  Background:
    Given I login with an existing account
    And upload photo from camera roll
    When I sign out from the account
    And login with user B account
    And user B loves user A photo and signs out
    When I log back with user A account

    Scenario: Receive an alert when someone loves user photo
      And go to alerts screen
      Then check love alert is shown
      And goes to UGC landing page after clicking on alert

    Scenario: Remove the photo and alert is not valid
      And go to alerts screen
      When I click on alert and remove the photo
      Then love alert is not valid