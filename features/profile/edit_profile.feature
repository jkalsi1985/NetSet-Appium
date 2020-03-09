Feature: Edit profile
  I want to edit my profile to update my profile or background photo or bio

  Background:
    Given I register and go to feed screen

    @sanity-all
    Scenario: Edit profile details and check it saved
      When I go to profile screen
      And I click on edit profile button
      When I edit my profile details
      And capture details and close edit profile
      Then check changes are saved on edit profile screen

    Scenario: Change profile image
      When I go to profile screen
      And I click on edit profile button
      And change profile image
      Then profile image has changed

    Scenario: Change background image
      When I go to profile screen
      And I click on edit profile button
      And change background image
      Then background image has changed

    Scenario: Fill in tell us more about information and save it
      When I click on edit profile button
      And fill in tell us about more detail sections
      And save the details on edit profile
      Then check tell us more details are saved

    Scenario: Fill in tell us about user and cancel it
      When I click on edit profile button
      And fill in tell us about more detail sections
      And cancel the edit profile
      Then check tell us more details are not saved

    Scenario: Edit the bio on user profile
      When I click on edit profile button
      And I edit the user bio and save it
      Then user bio is shown on profile screen

    Scenario: Enter URL on user bio
      When I click on edit profile button
      And enter URL in bio field and save it
      And I click on URL on profile screen
      Then web browser is displayed