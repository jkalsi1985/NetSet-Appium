Feature: Tag user, product or designer to photo

  Background:
    Given I register and go to feed screen
    When I choose and upload photo

    Scenario: Tag designer to photo
      And tag designer to photo
      Then designer will appear on the tag list
      When I post the image
      And tap on button to show tag on the feed
      Then designer tag will appear on ugc content

    Scenario: Tag user to photo
      And tag user to photo
      Then user will appear on the tag list
      When I post the image
      And tap on button to show tag on the feed
      Then user tag will appear on ugc content

    Scenario: Tag product to photo
      And tag product to photo
      Then product will appear on the tag list
      When I post the image
      And tap on button to show tag on the feed
      Then user tag will appear on ugc content

    Scenario: Add multiple tags to the photo
      And multiple tags to the photo
      Then check all the tags will appear
      When I post the image
      And tap on button to show tag on the feed
      Then all the tags will appear on ugc content

    Scenario: Remove tag from the photo
      And tag designer to photo
      Then designer will appear on the tag list
      And I post the image
      When I edit the photo and remove the tag
      And update the post
      Then tag button won't show on the feed

    Scenario: Attempt to add more than 10 tags
      And add more than 10 tags to the photo
      Then too many tags pop up is displayed