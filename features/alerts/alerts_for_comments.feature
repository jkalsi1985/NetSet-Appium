Feature: Comment alerts
  As a user, I should receive an alert when someone makes comment on my photo

  Background:
    Given I login with an existing account
    And upload photo from camera roll
    When I sign out from the account
    And login with user B account

    @sanity-all
    Scenario: Receive an alert when someone comment on user photo
      And add comment to someone's photo and sign out
      When I log back with user A account
      And go to alerts screen
      Then check comment alert is shown
      And goes to comment screen when click on alert

    Scenario: Add and remove comment and alert is not valid
      When I add and remove comment at the same time
      And I sign out from user B account
      When I log back with user A account
      And go to alerts screen
      Then sorry pop up is displayed after clicking on the alert

    Scenario: Add comment, delete photo from alert and comment is invalid
      And add comment and sign out
      When I log back with user A account
      And go to alerts screen
      When I click on alert and delete the photo
      Then we cannot load any comment message is displayed