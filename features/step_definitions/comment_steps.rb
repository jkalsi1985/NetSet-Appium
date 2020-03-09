Given(/^upload photo from camera roll$/) do
  navigation_tab_bar_screen.click_on_upload_button
  upload_photo_from_camera_roll
  browse_feed_screen.capture_profile_username
end

And(/^I add first comment to photo$/) do
  go_to_comment_screen_and_add_comment(generate_random_comments)
  comments_screen.capture_first_comment
end

And(/^I go back to browse feed$/) do
  common_screen.go_back_to_previous_screen
end

And(/^comment is displayed on browse feed$/) do
  expect(browse_feed_screen.assert_first_comment_displayed).to be true
  assert_first_comment_is_displayed
end

And(/^check the comment is displayed on browse feed$/) do
  common_screen.go_back_to_previous_screen
  assert_first_comment_is_displayed
end

When(/^I go back to comment screen$/) do
  browse_feed_screen.click_on_first_comment_on_this_button
  wait { expect(comments_screen.comments_title.displayed?).to be true }
end

And(/^I delete first comment$/) do
  comments_screen.delete_first_comment
end

Then(/^comment doesn't display on browse feed$/) do
  common_screen.go_back_to_previous_screen
  sleep 2
end

When(/^I add comment with hashtag sign$/) do
  go_to_comment_screen_and_add_comment("#black")
  comments_screen.capture_first_comment
end

When(/^I click on hashtag sign$/) do
  browse_feed_screen.tap_on_hastag_sign_in_comment
end

When(/^I click on someone username in the comment$/) do
  browse_feed_screen.tap_on_username_in_comment
end

When(/^I want to add netset user when adding comment$/) do
  go_to_comment_screen_and_add_comment("@profile1profile")
  comments_screen.capture_first_comment
end

Then(/^goes to user profile screen$/) do
  sleep 1
  expect(find_element(:name, "PROFILE1PROFILE").displayed?).to be true
end

And(/^I add two extra comments$/) do
  comments_screen.enter_and_post_comment("Comment2")
  comments_screen.enter_and_post_comment("Comment3")
end

Then(/^last two comments and view all comments are displayed$/) do
  first_comment = browse_feed_screen.capture_first_content_comment
  source_one = browse_feed_screen.user_profile_name+":"+" "+"Comment3"
  expect(first_comment).to eql(source_one)

  second_comment = browse_feed_screen.capture_second_content_comments
  source_two = browse_feed_screen.user_profile_name+":"+" "+"Comment2"
  expect(second_comment).to eql(source_two)
  #
  # view_all_comment_text = browse_feed_screen.capture_view_all_comments
  # expect(view_all_comment_text).to eql("View all 3 comments")
end

When(/^I click to view all comments$/) do
  select_one_option_from_feed_filter("Photos")
  browse_feed_screen.click_on_filter_apply_button
  browse_feed_screen.click_on_view_all_comments_button
  wait { expect(comments_screen.comments_title.displayed?).to be true }
end

And(/^delete the last comment$/) do
  comments_screen.delete_last_comment
end

And(/^second last comment is replaced with first comment$/) do
  common_screen.go_back_to_previous_screen
  second_comment = browse_feed_screen.capture_second_content_comments
  source = browse_feed_screen.user_profile_name+":"+" "+comments_screen.first_comment
  expect(second_comment).to eql(source)
end

Then(/^comment count has increased by (\d+)$/) do |comment_count|
  total_comment = browse_feed_screen.capture_first_total_comments
  expect(total_comment).to eql(comment_count)
end

And(/^add comment to someone's photo and sign out$/) do
  go_to_comment_screen_and_add_comment("OMG! I love this photo")
  common_screen.go_back_to_previous_screen
  sign_out_from_the_account
end

And(/^add comment and sign out$/) do
  comment = test_data['comment']
  go_to_comment_screen_and_add_comment(comment)
  common_screen.go_back_to_previous_screen
  sign_out_from_the_account
end

When(/^I add and remove comment at the same time$/) do
  comment = test_data['comment']
  go_to_comment_screen_and_add_comment(comment)
  common_screen.go_back_to_previous_screen
  delete_first_comment
end

And(/^I sign out from user B account$/) do
  sign_out_from_the_account
end

When(/^I enter special characters into the comment$/) do
  go_to_comment_screen_and_add_comment("£@%$$^$%^$%&%")
end

And(/^special characters is displayed on browse feed$/) do
  browse_feed_comment = browse_feed_screen.capture_first_content_comment
  source = browse_feed_screen.user_profile_name+":"+" "+"£@%$$^$%^$%&%"
  expect(browse_feed_comment).to eql(source)
end

When(/^I click on reply button$/) do
  browse_feed_screen.click_on_first_comment_on_this_button
  wait { expect(comments_screen.comments_title.displayed?).to be true }
  comments_screen.click_first_reply_button
end

When(/^I add and post comment$/) do
  comments_screen.enter_and_post_comment("OMG I love this product")
end

And(/^I go back to product landing page$/) do
  common_screen.go_back_to_previous_screen
end

Then(/^username from reply comment is shown in comment field$/) do
  reply_comment_username = comments_screen.comment_username.value
  comment_field_value = comments_screen.write_your_comment_field.value
  comment_field_value.match "@"+reply_comment_username+":"+" "
end