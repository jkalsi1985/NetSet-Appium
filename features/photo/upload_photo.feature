Feature: Upload photos
  As a user, I want upload photos from my camera roll
  I want to post them on The netset app

  Background:
    Given I register and go to feed screen
    When upload photo from camera roll
    And I go to profile screen

    Scenario: Upload photo and check photo count has increase
      Then photo count has increased by 1

    Scenario: Upload and delete photo
      And photo count has increased by 1
      When I delete the ugc photo
      Then photo count has reduced by 0