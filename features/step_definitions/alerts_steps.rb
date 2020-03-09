And(/^go to alerts screen$/) do
  navigation_tab_bar_screen.click_on_alerts_button
  wait { expect(alerts_screen.alerts_title.displayed?).to be true }
end

Then(/^check love alert is shown$/) do
  alerts_screen.assert_comment_alert("profile1profile loves your photo")
end

When(/^I click on alert and remove the photo$/) do
  alerts_screen.click_on_first_alert
  ugc_landing_screen.click_on_more_option_and_delete
  wait { expect(alerts_screen.alerts_title.displayed?).to be true }
end

Then(/^love alert is not valid$/) do
  navigation_tab_bar_screen.click_on_upload_button
  navigation_tab_bar_screen.click_on_alerts_button
  alerts_screen.click_ok_option_from_sorry_photo_deleted_popup
end

Then(/^check comment alert is shown$/) do
  alerts_screen.assert_comment_alert("profile1profile commented on your photo \"OMG! I love this photo\"")
end

Then(/^sorry pop up is displayed after clicking on the alert$/) do
  alert_message = alerts_screen.capture_alert_message
  alert_message.match "profile1profile commented on your photo"
  alerts_screen.click_ok_option_on_deleted_comment_popup
end

Then(/^we cannot load any comment message is displayed$/) do
  common_screen.go_back_to_previous_screen
  alerts_screen.click_on_first_alert
  wait { expect(comments_screen.comments_title.displayed?).to be true }
  expect(comments_screen.no_comment_right_now_message.displayed?).to be true
end

When(/^I click on alert and delete the photo$/) do
  alerts_screen.click_on_first_alert
  wait { expect(comments_screen.comments_title.displayed?).to be true }
  sleep 2
  comments_screen.click_ugc_image_in_comments_screen
  ugc_landing_screen.click_on_more_option_and_delete
end

Then(/^check admire alert is displayed$/) do
  alerts_screen.assert_comment_alert(@username_from_profile+" "+"admires"+" "+"you")
end

And(/^click on alert and goes to their profile screen$/) do
  alerts_screen.click_on_first_alert
  wait { expect(profile_screen.profile_name.displayed?).to be true }
end

And(/^goes to comment screen when click on alert$/) do
  alerts_screen.click_on_first_alert
  wait { expect(comments_screen.comments_title.displayed?).to be true }
end

And(/^goes to UGC landing page after clicking on alert$/) do
  alerts_screen.click_on_first_alert
  wait { expect(ugc_landing_screen.ugc_image_view.displayed?).to be true }
end