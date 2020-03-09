Given(/^I tap on sign in button from welcome screen$/) do
  go_to_sign_in_screen
end

When(/^I login with valid details$/) do
  email_address = test_data['users']['existing']['emailaddress']
  password = test_data['users']['existing']['password']
  sign_in_screen.submit_sign_in_details(email_address,password)
end

Then(/^browse feed screen is displayed$/) do
  sleep 5
  common_screen.click_tooltip_view
  sleep 2
  browse_feed_screen.click_on_filter_apply_button
end

When(/^I try to sign in with an invalid email address$/) do
  email_address = test_data['emails']['invalid_email']
  password = test_data['passwords']['valid_password']
  sign_in_screen.submit_sign_in_details(email_address,password)
end

When(/^I try to sign in with an invalid password$/) do
  email_address = test_data['emails']['valid_email']
  password = test_data['passwords']['not_matching_password']
  sign_in_screen.submit_sign_in_details(email_address,password)
end

Then(/^sign in is not successful$/) do
  expect(sign_in_screen.sign_in_title.displayed?).to be true
end

And(/^I see incorrect email address and password message$/) do
  expect(sign_in_screen.incorrect_login_details_message.displayed?).to be true
end

Given(/^I choose go to register screen from welcome screen$/) do
  go_to_register_screen
end

When(/^I enter valid registration details$/) do
  @email_address, @first_name, @surname = enter_personal_details
  enter_password(test_data['passwords']['valid_password'])
end

And(/^I submit registration details$/) do
  register_screen.click_on_register_button
  sleep 5
end

When(/^I enter email address already registration$/) do
  @email_address, @first_name, @surname = enter_personal_details(test_data['emails']['valid_email'])
  enter_password(test_data['passwords']['valid_password'])
end

Then(/^registration is not successful$/) do
  expect(register_screen.register_title.displayed?).to be true
end

And(/^already registered message is displayed$/) do
  expect(register_screen.already_registered_message.displayed?).to be true
end

And(/^type password that are not matching$/) do
  password = test_data['passwords']['valid_password']
  re_enter_password = test_data['passwords']['not_matching_password']
  register_screen.fill_in_password_not_matching(password, re_enter_password)
end

Then(/^register button is disabled$/) do
  register_screen.register_button.enabled?.should eq(false)
end

And(/^type passwords that are less than 6 characters$/) do
  enter_password("test")
end

And(/^password too short message is displayed$/) do
  expect(register_screen.password_too_short_message.displayed?).to be true
end

When(/^I enter personal details with invalid email address$/) do
  @email_address, @first_name, @surname = enter_personal_details(test_data['emails']['invalid_email'])
  enter_password(test_data['passwords']['valid_password'])
end

And(/^registration problem message is displayed$/) do
  expect(register_screen.register_error.displayed?).to be true
end

When(/^I enter valid personal details$/) do
  @email_address, @first_name, @surname = enter_personal_details
end

And(/^click on submit button$/) do
  invite_code_screen.click_on_submit_button
end

Then(/^goes to browse feed screen$/) do
  sleep 2
end

Given(/^register as new user$/) do
  register_as_new_user
end

Given(/^I register and go to feed screen$/) do
  register_and_go_to_feed_screen
end

And(/^login with user B account$/) do
  email_address = test_data['users']['existing']['emailaddress2']
  password = test_data['users']['existing']['password']
  enter_and_submit_login_details(email_address,password)
end

Given(/^I login with an existing account$/) do
  email_address = test_data['users']['existing']['emailaddress']
  password = test_data['users']['existing']['password']
  close_notification_and_submit_login_details(email_address,password)
end

When(/^I log back with user A account$/) do
  email_address = test_data['users']['existing']['emailaddress']
  password = test_data['users']['existing']['password']
  enter_and_submit_login_details(email_address,password)
end

Then(/^I sign out from the account$/) do
  sign_out_from_the_account
end

When(/^I login with an another account$/) do
  email_address = test_data['users']['existing']['emailaddress']
  password = test_data['users']['existing']['password']
  enter_and_submit_login_details(email_address,password)
end

And(/^sign out and login with different user$/) do
  sign_out_from_the_account
  email_address = test_data['users']['existing']['emailaddress']
  password = test_data['users']['existing']['password']
  enter_and_submit_login_details(email_address,password)
end