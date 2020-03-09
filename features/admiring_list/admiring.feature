Feature: Admiring brands and users
  In order to follow what brands or users have posted or commented
  I want to admire the brands or users, so I can follow them on my admire feed

  Background:
    Given I register and go to feed screen
    And I go to explore screen

    @sanity-all
    Scenario: Admire brand and shows in admiring list
      When search for "GHD" and select the brand
      And capture brand name on profile screen
      When I admire the brand
      And go to admiring list from profile screen
      Then brand will show on my admiring list

    Scenario: Unadmire the brand and admiring list is empty
      When search for "GHD" and select the brand
      And capture brand name on profile screen
      When I admire the brand
      And go to admiring list from profile screen
      Then brand will show on my admiring list
      When go back to brand profile screen and unadmire the brand
      Then admiring list is empty on profile screen

    Scenario: Admire user and check admiring list
      When I search for "profile1 profile" user
      And admire the user
      Then user will show on admiring list from profile screen

    Scenario: Admire multiple brands and check total on admiring link
      When I go to designer list
      And search for "RAHUA" and admire the brand
      And search for "J.CREW" and admire the brand
      And search for "VALENTINO" and admire the brand
      And search for "FENDI" and admire the brand
      Then admiring link has increased by four
      And all the brands admired shows in the list