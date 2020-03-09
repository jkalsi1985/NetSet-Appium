When(/^I love the first content from browse feed$/) do
  browse_feed_screen.click_on_love_button
end

When(/^I go to browse feed$/) do
  navigation_tab_bar_screen.click_on_browse_button
  wait { expect(browse_feed_screen.menu_item_feed.displayed?).to be true }
end

And(/^unlove the content just loved$/) do
  browse_feed_screen.click_on_love_button
end

Then(/^the content love count by increased by one$/) do
  total_love = browse_feed_screen.total_loves.first.value
  expect(total_love).to eql("1 Love")
end

Then(/^content love count is zero$/) do
  no_love = browse_feed_screen.total_loves.first.value
  expect(no_love).to eql("100 loves")
end

And(/^user B loves user A photo and signs out$/) do
  browse_feed_screen.click_on_love_button
  sign_out_from_the_account
end

When(/^i click on image product$/) do
  browse_feed_screen.click_on_first_product_image
  execute_script "mobile: scrollTo", :element => find_element(:xpath, "//UIAApplication[1]/UIAWindow[2]/UIAScrollView[1]/UIAImage[4]").ref
end

And(/^I click on love button on the content$/) do
  browse_feed_screen.click_on_first_content_loves_link
  wait { expect(lovers_screen.lovers_title.displayed?).to be true }
end

Then(/^last user shows in the list$/) do
  lovers_screen.find_last_username_loved_content(@username_from_final_setup)
end

And(/^I love the content$/) do
  navigation_tab_bar_screen.click_on_profile_button
  sleep 2
  navigation_tab_bar_screen.click_on_browse_button
  sleep 2
  browse_feed_screen.click_on_love_button
end

Then(/^both love and comment count is shown on the feed$/) do
  total_comments = browse_feed_screen.capture_first_total_comments
  total_love = browse_feed_screen.capture_first_total_love
  expect(total_comments).to eq("1")
  expect(total_love).to eq("1")
end

When(/^I click on loves total, goes to lovers screen$/) do
  browse_feed_screen.click_first_love_total_button
  wait { expect(lovers_screen.lovers_title.displayed?).to be true }
end

And(/^I click on comment total, goes to comments screen$/) do
  common_screen.go_back_to_previous_screen
  browse_feed_screen.click_on_first_comment_on_this_button
  wait { expect(comments_screen.comments_title.displayed?).to be true }
end

Then(/^"([^"]*)" is shown on the content$/) do |caption_message|
  caption_message_on_content = browse_feed_screen.caption_message
  expect(caption_message_on_content).to include caption_message
end

When(/^I filter and apply feed by "([^"]*)" only$/) do |filter_option|
  select_one_option_from_feed_filter(filter_option)
  browse_feed_screen.click_on_filter_apply_button
end

And(/^I click on apply button$/) do
  browse_feed_screen.click_on_filter_apply_button
end

Then(/^username is displayed/) do
  expect(browse_feed_screen.username_on_feed.displayed?). to be true
end

Then(/^you not admiring anyone yet message is displayed$/) do
  expect(browse_feed_screen.no_admires_message.displayed?).to be true
end

Then(/^only style council content is shown$/) do
  sleep 2
end

When(/^I filter by "([^"]*)" and "([^"]*)"$/) do |everyone_option, everything_option|
  select_two_options_from_feed_filter(everyone_option, everything_option)
end

Then(/^list only shows style council with products$/) do
  style_council = browse_feed_screen.capture_first_content_username
  expect(style_council).to eq("quentinjones")
end

When(/^I hide user from feed$/) do
  @hide_first_content_username = browse_feed_screen.capture_first_content_username
  browse_feed_screen.hide_user_from_feed
  select_one_option_from_feed_filter("Photos")
  browse_feed_screen.click_on_filter_apply_button
end

Then(/^user uploaded content is hidden from the feed$/) do
  browse_feed_screen.hide_user_from_feed
  @first_content_username = browse_feed_screen.capture_first_content_username
  expect(@first_content_username).not_to eql(@hide_first_content_username)
end

When(/^report problem with the content$/) do
  @content_username = browse_feed_screen.capture_first_content_username
  browse_feed_screen.report_content_problem
end

Then(/^content is not hidden$/) do
  expect(@content_username).to eq(@content_username)
end

When(/^I tap on UGC image on the feed$/) do
  @hide_first_content_username = browse_feed_screen.capture_first_content_username
  browse_feed_screen.content_image.first.click
  sleep 2
end

And(/^hide user from UGC landing screen$/) do
  ugc_landing_screen.hide_user_from_ugc_landing_screen
end

Then(/^user is hidden from the feed$/) do
  common_screen.go_back_to_previous_screen
  select_one_option_from_feed_filter("Photos")
  browse_feed_screen.click_on_filter_apply_button
  @first_content_username = browse_feed_screen.capture_first_content_username
  expect(@first_content_username).not_to eql(@hide_first_content_username)
end

And(/^I click on shop button any any content$/) do
  browse_feed_screen.click_on_style_ideas_button
end

Then(/^goes to style ideas landing screen$/) do
  sleep 2
  # wait { expect(ugc_landing_screen.ugc_image_view.displayed?).to be true }
end

And(/^tap any products thats able to shop$/) do
  browse_feed_screen.click_on_buy_it_now_button
end

Then(/^goes to product landing screen$/) do
  wait { expect(product_landing_screen.product_image.displayed?).to be true }
end

Then(/^love tooltip is shown$/) do
  tooltip_title = common_screen.capture_tooltip_title
  expect(tooltip_title).to eql("Build your Love List")
  tooltip_description = common_screen.capture_tooltip_description
  expect(tooltip_description).to eql("Tap the heart, or double tap the image, on the items that make your heart flutter. Anything you love will be saved in your profile.")
end

Then(/^location tooltip is shown$/) do
  tooltip_title = common_screen.capture_tooltip_title
  expect(tooltip_title).to eql("Shop by location")
  tooltip_description = common_screen.capture_tooltip_description
  expect(tooltip_description).to eql("Tap on city names to uncover what’s trending in that area.")
end

Then(/^browse feed tooltip is shown$/) do
  tooltip_title = common_screen.capture_tooltip_title
  expect(tooltip_title).to eql("Curate the Live Feed")
  tooltip_description = common_screen.capture_tooltip_description
  expect(tooltip_description).to eql("Tap on the filters above the feed to customise the content you see. You can toggle between views whenever you like.")
end

And(/^close the browse feed tooltip$/) do
  common_screen.click_tooltip_view
  browse_feed_screen.click_on_filter_apply_button
end

And(/^go back to browse feed$/) do
  navigation_tab_bar_screen.click_on_browse_button
end

And(/^close the location tooltip pop up$/) do
  wait { expect(common_screen.tooltip_title.displayed?).to be true }
  common_screen.click_tooltip_view
end

When(/^I love photo or product on feed$/) do
  navigation_tab_bar_screen.click_on_profile_button
  sleep 2
  navigation_tab_bar_screen.click_on_browse_button
  sleep 2
  browse_feed_screen.click_on_love_button
end

When(/^I search for "([^"]*)" on the Netset$/) do |search_value|
  search_for_something(search_value)
end

When(/^I edit the photo and remove the tag$/) do
  browse_feed_screen.click_to_edit_ugc_content
  sleep 2
  upload_screen.remove_first_tag
end

Then(/^tag button won't show on the feed$/) do
  expect(explore_screen.show_or_hide_tags_button.first.displayed?).to be false
end