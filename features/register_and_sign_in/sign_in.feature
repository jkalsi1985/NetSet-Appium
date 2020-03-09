Feature: Sign in into Net set app

  Background:
    Given I tap on sign in button from welcome screen

    @sanity-all
    Scenario: Existing user successfully signs in
      When I login with valid details
      Then browse feed screen is displayed

    Scenario Outline: Sign in with invalid email or password
      When I try to sign in with an <invalid_credentials>
      Then sign in is not successful
      And I see incorrect email address and password message

      Examples:
        | invalid_credentials        |
        | invalid email address      |

      Examples:
        | invalid_credentials        |
        | invalid password           |