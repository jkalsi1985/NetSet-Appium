Feature: Love list
  Start building your love list by loving product or ugc photo

  Background:
    Given I register and go to feed screen

    @sanity-all
    Scenario: unlove the content from profile screen and check love count
      When I filter and apply feed by "Photos" only
      And I love the first content from browse feed
      And I go to profile screen
      Then love count has increased by 1
      When unlove product from the love table
      Then love count is 0

    Scenario: Unlove the content from browse feed and check love count
      When I filter and apply feed by "Photos" only
      And I love the first content from browse feed
      And love count has increased by 1 on profile screen
      When I go to browse feed
      And unlove the content just loved
      Then love count is 0 on profile screen