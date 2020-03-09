When(/^I click on sort button$/) do
  product_listing_screen.click_on_sort_and_filter_button
  sort_screen.click_on_sort_by_button
  sleep 1
end

And(/^I select "([^"]*)" option$/) do |sort_option|
  sort_screen.sort_by(sort_option)
  sort_screen.click_on_apply_button
end

Then(/^the product price should be sorted by low to high$/) do
  @after_sort_product_price = product_listing_screen.capture_first_product_price
  expect(@after_sort_product_price).to be <= @before_sort_product_price
end

Then(/^the product price should be sorted by high to low$/) do
  @after_sort_product_price = product_listing_screen.capture_first_product_price
  expect(@after_sort_product_price).to be >= @before_sort_product_price
end

And(/^I filter by "([^"]*)" designer$/) do |designer|
  filter_by_designer(designer)
end

Then(/^product listing is filtered by selected designer$/) do
  product_listing_screen.capture_all_designer_name("ADIDAS ORIGINALS")
end

When(/^I click on "([^"]*)" option$/) do |find_option|
  explore_screen.choose_any_find_option(find_option)
  sleep 2
end

Then(/^product list is filtered by "([^"]*)"$/) do |selected_category|
  product_listing_screen.click_on_sort_and_filter_button
  filters_screen.capture_selected_category(selected_category)
  filters_screen.click_on_close_button
end

And(/^show sold out products$/) do
  sleep 5
  product_listing_screen.view_fill_shop_collection_list
  product_listing_screen.click_on_sort_and_filter_button
  filters_screen.click_sold_out_toggle_button
  filters_screen.click_on_apply_button
  sleep 2
end

Then(/^list will show sold out products$/) do
  pry;
  product_listing_screen.find_sold_out_products
end

And(/^I select "([^"]*)", "([^"]*)" and "([^"]*)"$/) do |first_category, second_category, third_category|
  filter_the_product_list(first_category,second_category,third_category)
end