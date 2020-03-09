Feature: As a user, I can add or remove comment on UGC content

  Background:
    Given I register and go to feed screen
    And upload photo from camera roll

    Scenario: Add first comment to the content
      When I add first comment to photo
      And I go back to browse feed
      Then comment count has increased by 1
      And comment is displayed on browse feed

    Scenario: Enter special characters into comment
      When I enter special characters into the comment
      And I go back to browse feed
      Then comment count has increased by 1
      And special characters is displayed on browse feed

    Scenario: Remove first comment from UGC content
      When I add first comment to photo
      And check the comment is displayed on browse feed
      And I go back to comment screen
      When I delete first comment
      Then comment doesn't display on browse feed

    Scenario: Reply to comment
      When I add first comment to photo
      And I sign out from the account
      When I login with an another account
      And I click on reply button
      Then username from reply comment is shown in comment field

    Scenario: Add and delete multiple comments to check updates browse feed
      When I add first comment to photo
      And I add two extra comments
      When I go back to browse feed
      And comment count has increased by 3
      Then last two comments and view all comments are displayed
      When I click to view all comments
      And delete the last comment
      Then second last comment is replaced with first comment

    Scenario: Enter comment with hashtag and check goes to search screen
      When I add comment with hashtag sign
      And check the comment is displayed on browse feed
      When I click on hashtag sign
      Then goes to find search result

    Scenario: Enter comment with @ sign and check goes to user profile screen
      When I want to add netset user when adding comment
      And check the comment is displayed on browse feed
      When I click on someone username in the comment
      Then goes to user profile screen

    Scenario: Comment and love the same content
      When I add first comment to photo
      And I go back to browse feed
      And I love the content
      Then both love and comment count is shown on the feed
      When I click on loves total, goes to lovers screen
      And I click on comment total, goes to comments screen