Then(/^style tribe members count increased by one$/) do
  @new_current_total_members = style_tribes_screen.current_style_tribe_total_members
  expect(@new_current_total_members).to be > @current_total_members
end

And(/^I don't want to be member of style tribe anymore$/) do
  style_tribes_screen.click_on_member_button
  common_screen.go_back_to_previous_screen
  common_screen.go_back_to_previous_screen
end

When(/^I view list of style tribes$/) do
  go_to_explore_and_close_tooltip
  explore_screen.choose_any_find_option("STYLE TRIBES")
  wait { expect(style_tribes_screen.style_tribes_title.displayed?).to be true }
end

Then(/^goes to find search result$/) do
  sleep 2
  find_search_result = explore_screen.search_field.value
  expect(find_search_result).to eq("black")
end

When(/^I go to designer list$/) do
  navigation_tab_bar_screen.click_on_explore_button
  explore_screen.choose_any_find_option("DESIGNER A-Z")
  wait { expect(designer_screen.designer_title.displayed?).to be true }
  sleep 2
end

And(/^I go to explore screen$/) do
  navigation_tab_bar_screen.click_on_explore_button
end

And(/^join style tribe and capture current members$/) do
  pry;
  @current_total_members = style_tribes_screen.current_style_tribe_total_members
  style_tribes_screen.click_on_join_tribe_button
end

And(/^I join style style tribe$/) do
  style_tribes_screen.click_on_join_tribe_button
end

And(/^I go to "([^"]*)" category$/) do |category|
  navigation_tab_bar_screen.click_on_explore_button
  explore_screen.choose_any_find_option(category)
end

When(/^I search for "([^"]*)" user$/) do |value|
  search_for_something(value)
end

And(/^I search, admire "([^"]*)" user and sign out$/) do |value|
  navigation_tab_bar_screen.click_on_explore_button
  search_for_something(value)
  explore_screen.select_result_tab("People & Designers")
  explore_screen.click_on_search_result_cell("profile1 profile")
  profile_screen.click_on_edit_profile_button
  sign_out_from_the_account
end

And(/^I search, unadmire "([^"]*)" user and sign out$/) do |value|
  navigation_tab_bar_screen.click_on_explore_button
  search_for_something(value)
  explore_screen.click_on_search_result_cell("Jag Testing")
  profile_screen.click_on_edit_profile_or_admiring_button
  sign_out_from_the_account
end

And(/^admire the user$/) do
  explore_screen.click_on_search_result_cell("profile1 profile")
  profile_screen.click_on_edit_profile_button
end

And(/^go to product listing of any brand$/) do
  search_and_select_designer("Gucci")
  sleep 3
  product_listing_screen.view_fill_shop_collection_list
end

Then(/^style tribe tooltip is shown$/) do
  tooltip_title = common_screen.capture_tooltip_title
  expect(tooltip_title).to eql("Find your Style Tribe")
  tooltip_description = common_screen.capture_tooltip_description
  expect(tooltip_description).to eql("Join the tribes that suit your style to discover more content, brands, people and products that you may love.")
end

When(/^I navigate to explore screen$/) do
  navigation_tab_bar_screen.click_on_explore_button
  sleep 2
end

Then(/^search result is displayed$/) do
  wait { expect(find_element(:name, "All").displayed?).to be true }
end

Then(/^we cant find result message is displayed$/) do
  wait { expect(find_element(:name, "We couldn't find any results").displayed?).to be true }
end