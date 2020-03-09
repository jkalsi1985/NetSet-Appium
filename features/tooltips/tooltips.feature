#Feature: Tooltips explains to the user what feed, loving something, location and explore does
#
#    Scenario: Browse feed tooltip
#      Given register as new user
#      Then browse feed tooltip is shown
#
#    Scenario: Love tooltip
#      Given register as new user
#      And close the browse feed tooltip
#      When I love photo or product on feed
#      Then love tooltip is shown
#
#    Scenario: Style tribe tooltip
#      Given register as new user
#      And close the browse feed tooltip
#      When I navigate to explore screen
#      Then style tribe tooltip is shown
#
#    Scenario: Location tooltip
#      Given register as new user
#      And close the browse feed tooltip
#      When upload a photo
#      Then location tooltip is shown
#
#    Scenario: Reset the tooltip from settings
#      Given register as new user
#      And close the browse feed tooltip
#      When I reset tooltips
#      And go back to browse feed
#      Then browse feed tooltip is shown
#
#    Scenario: Badges tooltip
#      Given I login with an existing account
#      And navigate to profile screen
#      Then badges tooltip is shown
#
#    Scenario: Get tagging tooltip
#      Given register as new user
#      And close the browse feed tooltip
#      When I select and save photo from the list
#      Then get tagging tooltip is shown