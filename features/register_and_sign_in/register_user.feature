Feature: Register a new Netset user
  As a guest user of netset
  I want to register
  So that I can socialise with brands

  Background:
    Given I choose go to register screen from welcome screen

    @sanity-all
    Scenario: Happy path-register user from welcome screen
      When I enter valid registration details
      And I submit registration details
      Then goes to browse feed screen

    Scenario: Submit registration details with already existing email address
      When I enter email address already registration
      And I submit registration details
      Then registration is not successful
      And already registered message is displayed

    Scenario: Submit registration details when password not matching
      When I enter valid personal details
      And type password that are not matching
      Then register button is disabled

    Scenario: Submit registration details with password less than 6 characters
      When I enter valid personal details
      And type passwords that are less than 6 characters
      And I submit registration details
      Then registration is not successful
      And password too short message is displayed

    Scenario: Submit registration details with invalid email address
      When I enter personal details with invalid email address
      And I submit registration details
      Then registration is not successful
      And registration problem message is displayed