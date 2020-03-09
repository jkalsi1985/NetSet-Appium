And(/^I click on photo button$/) do
  profile_screen.click_on_photo_button
end

And(/^I delete the ugc photo$/) do
  profile_screen.click_on_photo_button
  profile_screen.click_on_first_uploaded_photo
  ugc_landing_screen.click_on_more_option_and_delete
  common_screen.go_back_to_previous_screen
end

When(/^I add style tribe after uploading photo$/) do
  add_style_tribe_after_uploading_ugc_photo
end

Then(/^check style tribe added to ugc photo$/) do
  feature_style_tribe_text = ugc_landing_screen.style_tribe_title.value
  feature_style_tribe_text.match "Double Denim"
end

And(/^I upload photo and add "([^"]*)" message$/) do |caption|
  upload_photo_and_add_caption_message_from_camera_roll(caption)
end

And(/^go to style tribe screen from ugc landing screen$/) do
  sleep 2
  browse_feed_screen.click_on_first_content_image
  ugc_landing_screen.click_on_add_to_your_style_tribe_button
end

When(/^upload a photo$/) do
  navigation_tab_bar_screen.click_on_upload_button
  upload_screen.click_all_photo_text
  sleep 2
  upload_screen.select_and_click_first_camera_image
  wait { expect(upload_screen.move_and_scale_title.displayed?).to be true }
  upload_screen.click_on_move_and_scale_save_button
  sleep 3
  close_tooltip_popup
  wait { expect(upload_screen.write_your_caption_message.displayed?).to be true }
  upload_screen.click_on_ugc_post_button
  sleep 5
end

When(/^I select and save photo from the list$/) do
  navigation_tab_bar_screen.click_on_upload_button
  upload_screen.click_all_photo_text
  sleep 2
  upload_screen.select_and_click_first_camera_image
  wait { expect(upload_screen.move_and_scale_title.displayed?).to be true }
  upload_screen.click_on_move_and_scale_save_button
  sleep 3
end

Then(/^get tagging tooltip is shown$/) do
  tooltip_title = common_screen.capture_tooltip_title
  expect(tooltip_title).to eql("Get Tagging")
  tooltip_description = common_screen.capture_tooltip_description
  expect(tooltip_description).to eql("Now you can tag the exact product, person or designer featured in an image. Tap here to give it a try!")
end

And(/^I choose and upload photo$/) do
  navigation_tab_bar_screen.click_on_upload_button
  upload_screen.click_all_photo_text
  sleep 2
  upload_screen.select_and_click_first_camera_image
  wait { expect(upload_screen.move_and_scale_title.displayed?).to be true }
  upload_screen.click_on_move_and_scale_save_button
  sleep 3
end

When(/^tag designer to photo$/) do
  upload_screen.click_to_tag_designer
  select_tag_designer_screen.tap_on_first_designer_label
  sleep 2
  upload_screen.click_on_move_and_scale_save_button
end

And(/^tap on button to show tag on the feed$/) do
  explore_screen.tap_on_show_or_hide_button
end

Then(/^something happens$/) do
  pry;
end

Then(/^designer will appear on the tag list$/) do
  tag_label = upload_screen.capture_first_tag_value
  expect(tag_label).to eql("111Skin")
end

When(/^I post the image$/) do
  upload_screen.click_on_ugc_post_button
  sleep 5
  close_location_tooltip
end

Then(/^designer tag will appear on ugc content$/) do
  sleep 1
end

Then(/^user tag will appear on ugc content$/) do
  sleep 1
end

And(/^tag user to photo$/) do
  upload_screen.click_to_tag_user
  explore_screen.search_for_neset("jag test")
  explore_screen.tap_on_first_user_from_search_result
  sleep 2
  upload_screen.click_on_move_and_scale_save_button
end

Then(/^user will appear on the tag list$/) do
  tag_label = upload_screen.capture_first_tag_value
  expect(tag_label).to include("Jag Testing")
end

And(/^tag product to photo$/) do
  upload_screen.click_to_tag_product
  sleep 5
  select_tag_designer_screen.tap_on_first_designer_label
  sleep 15
  product_listing_screen.click_on_first_product_image
  sleep 2
  upload_screen.click_on_move_and_scale_save_button
end

Then(/^product will appear on the tag list$/) do
  expect(upload_screen.tag_label[1].displayed?).to be true
end

Then(/^all the tags will appear on ugc content$/) do
  sleep 1
end

And(/^multiple tags to the photo$/) do
  upload_screen.click_to_tag_designer
  select_tag_designer_screen.tap_on_first_designer_label
  sleep 2
  execute_script 'mobile: tap', :x => 200, :y => 250, :fingers => 1, :tapCount => 1, :duration => 0.6
  upload_screen.tag_designer_button
  select_tag_designer_screen.tap_on_second_designer_label
  sleep 2
  execute_script 'mobile: tap', :x => 205, :y => 300, :fingers => 1, :tapCount => 1, :duration => 0.6
  upload_screen.tag_designer_button
  select_tag_designer_screen.tap_on_third_designer_label
  sleep 3
  execute_script 'mobile: tap', :x => 210, :y => 350, :fingers => 1, :tapCount => 1, :duration => 0.6
  upload_screen.tag_user_button
  explore_screen.search_for_neset("jag test")
  explore_screen.tap_on_first_user_from_search_result
  sleep 2
  upload_screen.click_on_move_and_scale_save_button
end

Then(/^check all the tags will appear$/) do
  firstTagLabel = upload_screen.capture_first_tag_value
  expect(firstTagLabel).to eql("111Skin")
  secondTagLabel = upload_screen.capture_second_tag_value
  expect(secondTagLabel).to eql("1205")
  thirdTagLabel = upload_screen.capture_third_tag_value
  expect(thirdTagLabel).to eql("AERIN")
  fourthTagLabel = upload_screen.capture_fourth_tag_value
  expect(fourthTagLabel).to include("Jag Testing")
end

And(/^update the post$/) do
  upload_screen.click_on_update_button
end

And(/^add more than 10 tags to the photo$/) do
  upload_screen.click_to_tag_designer
  search_and_select_for_designer("Balmain")
  execute_script 'mobile: tap', :x => 240, :y => 240, :fingers => 1, :tapCount => 1, :duration => 0.6
  upload_screen.tag_designer_button
  search_and_select_for_designer("Bamford")
  execute_script 'mobile: tap', :x => 290, :y => 290, :fingers => 1, :tapCount => 1, :duration => 0.6
  upload_screen.tag_designer_button
  search_and_select_for_designer("GHD")
  execute_script 'mobile: tap', :x => 340, :y => 340, :fingers => 1, :tapCount => 1, :duration => 0.6
  upload_screen.tag_designer_button
  search_and_select_for_designer("Gucci")
  execute_script 'mobile: tap', :x => 390, :y => 390, :fingers => 1, :tapCount => 1, :duration => 0.6
  upload_screen.tag_designer_button
  search_and_select_for_designer("Haney")
  execute_script 'mobile: tap', :x => 150, :y => 300, :fingers => 1, :tapCount => 1, :duration => 0.6
  upload_screen.tag_designer_button
  search_and_select_for_designer("Hatch")
  execute_script 'mobile: tap', :x => 170, :y => 200, :fingers => 1, :tapCount => 1, :duration => 0.6
  upload_screen.tag_designer_button
  search_and_select_for_designer("Issa")
  execute_script 'mobile: tap', :x => 210, :y => 200, :fingers => 1, :tapCount => 1, :duration => 0.6
  upload_screen.tag_designer_button
  search_and_select_for_designer("Jimmy Choo")
  execute_script 'mobile: tap', :x => 210, :y => 300, :fingers => 1, :tapCount => 1, :duration => 0.6
  upload_screen.tag_designer_button
  search_and_select_for_designer("Joya")
  execute_script 'mobile: tap', :x => 240, :y => 350, :fingers => 1, :tapCount => 1, :duration => 0.6
  upload_screen.tag_designer_button
  search_and_select_for_designer("KENZO")
  execute_script 'mobile: tap', :x => 280, :y => 400, :fingers => 1, :tapCount => 1, :duration => 0.6
end

Then(/^too many tags pop up is displayed$/) do
  sleep 2
end