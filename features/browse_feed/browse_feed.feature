Feature: Anyone that loves product or UGC will show on feed instantly for everyone to view.
  Netset users can either love, admire, view product or even hide user from the feed.

  Background:
    Given I register and go to feed screen

#    Scenario: Hide user from the feed
#      When upload photo from camera roll
#      And sign out and login with different user
#      When I hide user from feed
#      Then user uploaded content is hidden from the feed
#
#    Scenario: Hide user from UGC landing screen
#      When upload photo from camera roll
#      And sign out and login with different user
#      And I tap on UGC image on the feed
#      When hide user from UGC landing screen
#      Then user is hidden from the feed

#    @MOBNP-2763
#    Scenario: Report problem with content
#      And upload photo from camera roll
#      And sign out and login with different user
#      When report problem with the content
#      Then content is not hidden

    Scenario: Shop on UGC content from feed
      When I filter and apply feed by "Photos" only
      And I click on shop button any any content
      Then goes to style ideas landing screen

    Scenario: Tap on shop on any product
      When I filter and apply feed by "Products" only
      And tap any products thats able to shop
      Then goes to product landing screen

    Scenario: Search on browse feed
      When I search for "Jumper" on the Netset
      Then search result is displayed

    Scenario: Search for something that doesn't exist on Netset
      When I search for "^%&^%^" on the Netset
      Then we cant find result message is displayed