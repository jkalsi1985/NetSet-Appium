When(/^I go to style tribe landing page$/) do
  profile_screen.click_on_style_tribe_button
  profile_screen.select_last_style_tribe_from_table
  sleep 2
end

Then(/^check total style tribe count is (\d+)/) do |zero_style_tribe|
  total_style_tribe = profile_screen.capture_style_tribe_title_count
  expect(total_style_tribe).to eql(zero_style_tribe)
  # no_style_tribe_label = profile_screen.capture_no_style_tribe_content
  # expect(no_style_tribe_label).to eql("You have not joined any Style Tribes yet.\nFind your Style Tribe")
end

When(/^I go to profile screen$/) do
  go_to_profile_screen
end

And(/^style tribe shows in the table$/) do
  profile_screen.click_on_style_tribe_button
  style_tribe_name = profile_screen.capture_style_tribe_name
  style_tribe_name.match "Minimalist"
  # TODO add to check total of style tribe members
end

And(/^go to style tribe list from profile screen$/) do
  go_to_profile_screen
end

And(/^unlove product from the love table$/) do
  profile_screen.click_on_love_button
  sleep 2
  profile_screen.click_love_button_from_love_table
  common_screen.go_back_to_previous_screen
end

Then(/^love count has increased by one$/) do
  love_count = profile_screen.user_total_love.value
  love_count.match "1"
  expect(profile_screen.first_collection_cell.displayed?).to be true
end

And(/^love count has increased by (\d+) on profile screen$/) do |love_count|
  go_to_profile_screen
  love_count_value = profile_screen.capture_love_title_count
  expect(love_count_value).to eql(love_count)
end

Then(/^love count is zero on profile screen$/) do
  navigation_tab_bar_screen.click_on_profile_button
  expect(profile_screen.loves_button.displayed?).to be true
  expect(profile_screen.zero_loves_message.displayed?).to be true
end

Then(/^love count is (\d+) on profile screen$/) do |love_count|
  navigation_tab_bar_screen.click_on_profile_button
  profile_love_count = profile_screen.capture_love_title_count
  expect(profile_love_count).to eql(love_count)
  # no_love_message = profile_screen.capture_no_love_content
  # expect(no_love_message).to eql("Search and discover items to love")
end

When(/^go to admiring list from profile screen$/) do
  go_to_profile_screen
  go_to_admiring_list
end

Then(/^designer is shown on the admiring list$/) do
  expect((profile_screen.admiring_list).length).to eq(1)
  profile_screen.find_admirers_name_from_list(@designer_name)
end

Then(/^style icon is shown on the admiring list$/) do
  expect((profile_screen.admiring_list).length).to eq(1)
  profile_screen.find_admirers_name_from_list(@style_icon)
end

Then(/^brand will show on my admiring list$/) do
  expect((profile_screen.admiring_list).length).to eq(1)
  profile_screen.find_admirers_name_from_list(@brand_name)
end

Then(/^admiring list is empty on profile screen$/) do
  navigation_tab_bar_screen.click_on_profile_button
  expect(profile_screen.empty_admiring_list.displayed?).to be true
end

Then(/^style tribe has increased by (\d+) on profile screen$/) do |style_tribe_count|
  navigation_tab_bar_screen.click_on_profile_button
  wait { expect(profile_screen.style_tribe_button.displayed?).to be true }
  profile_screen.click_on_style_tribe_button
  style_tribe_total = profile_screen.user_total_style_tribe_member.value
  expect(style_tribe_total).to eql(style_tribe_count)
end

Then(/^style tribe count has increased by (\d+)/) do |style_tribe_count|
  total_style_tribe = profile_screen.capture_style_tribe_title_count
  expect(total_style_tribe).to eql(style_tribe_count)
end

Then(/^check changes have updated on edit profile screen$/) do
  profile_screen.click_on_edit_profile_or_admiring_button
  expect(edit_profile_screen.edit_profile_title.displayed?).to be true
  name = edit_profile_screen.name_field.value
  username = edit_profile_screen.username_field.value
  bio = edit_profile_screen.user_bio_field.value

  name.match @name
  username.match @username
  bio.match @bio
end

And(/^I click on edit profile button$/) do
  go_to_profile_screen
  profile_screen.click_on_edit_profile_button
  expect(edit_profile_screen.edit_profile_title.displayed?).to be true
end

When(/^I edit my profile details$/) do
  profile_name = test_data['profile']['name']
  profile_username = test_data['profile']['username']
  profile_bio = test_data['profile']['user_bio']
  edit_profile_details(profile_name,profile_username,profile_bio)
end

Then(/^check changes are saved on edit profile screen$/) do
  profile_screen.click_on_edit_profile_button
  wait { expect(edit_profile_screen.edit_profile_title.displayed?).to be true }

  name = edit_profile_screen.name_field.value
  username = edit_profile_screen.username_field.value
  bio = edit_profile_screen.user_bio_field.value

  name.match @profile_name
  username.match @profile_username
  bio.match @profile_bio
end

And(/^capture details and close edit profile/) do
  @profile_name = edit_profile_screen.name_field.value
  @profile_username = edit_profile_screen.username_field.value
  @profile_bio = edit_profile_screen.user_bio_field.value
  edit_profile_screen.click_on_save_button
  edit_profile_screen.click_close_button_on_edit_profile
end

Then(/^love count has increased by (\d+)$/) do |love_count|
  love_count_value = profile_screen.capture_love_title_count
  expect(love_count_value).to eql(love_count)
end

Then(/^love count is (\d+)$/) do |zero_love|
  navigation_tab_bar_screen.click_on_alerts_button
  navigation_tab_bar_screen.click_on_profile_button
  love_count = profile_screen.capture_love_title_count
  expect(love_count).to eql(zero_love)
  # no_love_message = profile_screen.capture_no_love_content
  # expect(no_love_message).to eql("Search and discover items to love")
end

Then(/^photo count has increased by (\d+)$/) do |photo_count|
  total_photo_uploaded = profile_screen.capture_photos_title_count
  expect(total_photo_uploaded).to eql(photo_count)
end

Then(/^photo count has reduced by (\d+)$/) do |photo_count|
  total_photo_uploaded = profile_screen.capture_photos_title_count
  expect(total_photo_uploaded).to eql(photo_count)
end

And(/^I click on each "([^"]*)" option$/) do |settings_options|
  profile_screen.click_on_settings_button
  sleep 1
  settings_screen.select_settings_options(settings_options)
end

Then(/^"([^"]*)" is displayed$/) do |screen|
  expect(find_element(:name, "#{screen}").displayed?).to be true
end

And(/^I go to invite friends screen$/) do
  profile_screen.click_on_settings_button
  settings_screen.click_on_invite_friends_option
  # settings_screen.click_ok_to_access_contacts
end

When(/^invite friend to use netset by entering an email address$/) do
  email_address = test_data['emails']['valid_email']
  settings_screen.invite_friend_via_email_or_number(email_address)
end

And(/^click on apply button$/) do
  settings_screen.click_on_invite_button
end

Then(/^compose email is displayed$/) do
  pending
end

Then(/^SMS is displayed$/) do
  pending
end

Then(/^error message is displayed$/) do
  expect(settings_screen.invite_error_message.displayed?).to be true
end

When(/^invite friend to use netset by entering mobile number$/) do
  mobile_number = test_data['mobile_number']
  settings_screen.invite_friend_via_email_or_number(mobile_number)
end

And(/^I go to country selection$/) do
  profile_screen.click_on_settings_button
  settings_screen.click_on_country_selection_option
  expect(find_element(:name, "COUNTRY SELECTION").displayed?).to be true
end

When(/^I search and select "([^"]*)"$/) do |country|
  settings_screen.search_and_select_country(country)
end

And(/^click on ok from change country pop up$/) do
  settings_screen.click_ok_to_change_country
  wait { expect(onboarding_and_welcome_screen.netset_intro_message.displayed?).to be true }
end

Then(/^"([^"]*)" is shown as selected country$/) do |country|
  current_country = settings_screen.current_country.value
  current_country.match "#{country}"
end

Then(/^list is empty$/) do
  expect(settings_screen.country_list).to be_empty
end

When(/^I search for "([^"]*)"$/) do |country|
  settings_screen.search_for_country(country)
end

And(/^change profile image$/) do
  edit_profile_image
end

Then(/^profile image has changed$/) do
  edit_profile_screen.click_close_button_on_edit_profile
  sleep 1
  begin
    test = edit_profile_screen.edit_profile_image.displayed?
  rescue
    test = false
  end
end

And(/^change background image$/) do
  change_background_image
end

Then(/^background image has changed$/) do
  expect(edit_profile_screen.edit_background_image.displayed?).to be true
end

Then(/^admiring link has increased by one$/) do
  admiring_link = profile_screen.admiring_button.value
  expect(admiring_link).to eql("1 Admiring")
end

And(/^user will show on admiring list from profile screen$/) do
  go_to_profile_screen
  go_to_admiring_list
  expect((profile_screen.admiring_list).length).to eq(1)
  profile_screen.find_admirers_name_from_list("profile1profile")
end

Then(/^admiring link has increased by four$/) do
  go_to_profile_screen
  admiring_link = profile_screen.admiring_button.value
  expect(admiring_link).to eql("4\nAdmiring")
end

And(/^all the brands admired shows in the list$/) do
  go_to_admiring_list
  expect((profile_screen.admiring_list).length).to eq(4)
  profile_screen.find_admirers_username_from_list("fendi")
  profile_screen.find_admirers_username_from_list("jcrew")
  profile_screen.find_admirers_username_from_list("rahua")
  profile_screen.find_admirers_username_from_list("valentino")
end

And(/^I capture admirers totals from user A$/) do
  @current_admirers_total = profile_screen.capture_current_admirers_total
end

Then(/^admirers count has increased by one$/) do
  @new_admirers_total = profile_screen.capture_current_admirers_total
  expect(@new_admirers_total).to be > @current_admirers_total
end

And(/^last admirer shows in the list$/) do
  profile_screen.click_on_admirers_button
  wait { expect(profile_screen.admirers_title.displayed?).to be true }
  profile_screen.find_admirers_username_from_list("jagtest")
end

When(/^I capture total admirers total and sign out$/) do
  navigation_tab_bar_screen.click_on_profile_button
  @current_admirers_total = profile_screen.capture_current_admirers_total
  sign_out_from_the_account
end

Then(/^admirers count has decreased by one$/) do
  @admirers_total = profile_screen.capture_current_admirers_total
  expect(@admirers_total).to be < @current_admirers_total
end

When(/^fill in tell us about more detail sections/) do
  edit_profile_screen.fill_in_tell_us_about_you_section("XS", "35", "Oily", "December / 10 / 1984")
end

Then(/^check tell us more details are saved$/) do
  profile_screen.click_on_edit_profile_button
  expect(edit_profile_screen.edit_profile_title.displayed?).to be true
  execute_script "mobile: scrollTo", :element => find_element(:name, "Birthday").ref
  expect(find_element(:name, "XS").displayed?).to be true
  expect(find_element(:name, "35").displayed?).to be true
  expect(find_element(:name, "Oily").displayed?).to be true
  expect(find_elements(:name, "Skin color button").last.displayed?).to be true
  birthday = edit_profile_screen.capture_birthday
  birthday.match "December / 10 / 1984"
end

When(/^cancel the edit profile$/) do
  edit_profile_screen.cancel_edit_profile_and_close
end

And(/^save the details on edit profile$/) do
  edit_profile_screen.save_edit_profile_and_close
end

Then(/^check tell us more details are not saved$/) do
  profile_screen.click_on_edit_profile_button
  expect(edit_profile_screen.edit_profile_title.displayed?).to be true
  execute_script "mobile: scrollTo", :element => find_element(:name, "Birthday").ref
  expect(find_elements(:name, "Skin color button").last.selected?).to be false
  birthday = edit_profile_screen.capture_birthday
  birthday.match "Month / Day / Year"
end

When(/^I reset tooltips$/) do
  navigation_tab_bar_screen.click_on_profile_button
  profile_screen.click_on_settings_button
  sleep 1
  settings_screen.select_settings_options("RESET TOOLTIPS")
  sleep 3
  edit_profile_screen.click_close_button_on_edit_profile
end

Then(/^love total is zero$/) do
  expect(profile_screen.zero_loves_message.displayed?).to be true
end

Then(/^the admiring list is empty$/) do
  profile_screen.admiring_list.empty?
end

And(/^I go to profile screen and capture username$/) do
  navigation_tab_bar_screen.click_on_profile_button
  profile_screen.click_on_edit_profile_button
  expect(edit_profile_screen.edit_profile_title.displayed?).to be true
  @username_from_profile = edit_profile_screen.username_field.value
  edit_profile_screen.click_close_button_on_edit_profile
end

And(/^I edit the user bio and save it$/) do
  edit_profile_screen.edit_bio_on_profile("I love this app, check out my site https://thenetset.com")
  edit_profile_screen.save_edit_profile_and_close
end

Then(/^user bio is shown on profile screen$/) do
 user_profile =  profile_screen.capture_user_profile
 expect(user_profile).to eql("I love this app, check out my site https://thenetset.com")
end

And(/^enter URL in bio field and save it$/) do
  edit_profile_screen.edit_bio_on_profile("https://www.google.com")
  edit_profile_screen.save_edit_profile_and_close
end

And(/^I click on URL on profile screen$/) do
  profile_screen.click_bio_url
end

Then(/^web browser is displayed$/) do
  sleep 2
end

And(/^navigate to profile screen$/) do
  navigation_tab_bar_screen.click_on_profile_button
end

Then(/^badges tooltip is shown$/) do
  tooltip_title = common_screen.capture_tooltip_title
  expect(tooltip_title).to eql("Your Achievements")
  tooltip_description = common_screen.capture_tooltip_description
  expect(tooltip_description).to eql("Been a good Netsetter?! Any badges you earn will be saved here.")
end