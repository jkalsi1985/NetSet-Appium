Feature: Style tribes
  Join style tribe to follow particular style
  So that I can shop based on style and follow what other users posted

  Background:
    Given I register and go to feed screen
    When I view list of style tribes

    Scenario: Add style tribe and check on profile screen
      And join style tribe and capture current members
      Then style tribe members count increased by one
      When go to style tribe list from profile screen
      Then style tribe count has increased by 1
      And style tribe shows in the table

    @sanity-all
    Scenario: Add and remove style tribe from profile screen
      And I join style style tribe
      Then go to style tribe list from profile screen
      And style tribe count has increased by 1
      When I go to style tribe landing page
      And I don't want to be member of style tribe anymore
      Then check total style tribe count is 0

    Scenario: Add style tribe on UGC content
      And I join style style tribe
      When I add style tribe after uploading photo
      And go to style tribe screen from ugc landing screen
      Then check style tribe added to ugc photo