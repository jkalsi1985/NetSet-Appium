And(/^capture brand name on profile screen$/) do
  @brand_name = profile_screen.profile_name.value
end

When(/^I admire the brand$/) do
  profile_screen.click_on_edit_profile_button
end

When(/^go back to brand profile screen and unadmire the brand$/) do
  navigation_tab_bar_screen.click_on_explore_button
  profile_screen.click_on_edit_profile_button
end

And(/^I click on first brand$/) do
  designer_screen.click_on_first_brand_from_list
end

And(/^I click on "([^"]*)" from designer list$/) do |letter|
  designer_screen.choose_letter_from_designer_list(letter)
end

And(/^I select "([^"]*)" brand$/) do |brand|
  designer_screen.search_and_select_designer(brand)
end

When(/^search for "([^"]*)" and select the brand$/) do |brand_name|
  search_and_select_for_brand(brand_name)
end

When(/^search for "([^"]*)" and admire the brand$/) do |brand_name|
  search_select_and_admire_brand(brand_name)
end

When(/^I admire Poppy Delevingne style council/) do
  search_and_select_style_council
  explore_screen.select_first_style_council
  profile_screen.click_on_edit_profile_button
end