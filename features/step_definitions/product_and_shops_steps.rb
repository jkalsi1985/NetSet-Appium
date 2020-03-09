When(/^go to product shop this screen$/) do
  go_to_product_shop_this_screen_from_brand_profile("3LAB")
end

And(/^I capture product details$/) do
  @brand_name = product_landing_screen.capture_brand_name
  @product_name = product_landing_screen.capture_product_details
end

When(/^add product to shopping basket$/) do
  product_landing_screen.click_add_to_bag_button
end

And(/^click on product love button$/) do
  product_details_and_style_ideas_screen.click_product_love_button
end

When(/^I select "([^"]*)" brand and go to "([^"]*)" screen$/) do |brand_name, product_screens|
  search_for_brand_go_to_any_product_options(brand_name,product_screens)
end

And(/^capture current comment total and click on it$/) do
  @current_total_comment = product_landing_screen.capture_current_comment_total
  product_landing_screen.click_on_total_comments_button
  wait { expect(comments_screen.comments_title.displayed?).to be true }
end

Then(/^total comments has increased by one$/) do
  @new_total_comment = product_landing_screen.capture_current_comment_total
  expect(@new_total_comment).to be > @current_total_comment
end

And(/^last comment is shown on the screen$/) do
  first_comment = product_landing_screen.capture_first_product_comment
  expect(first_comment).to include("OMG I love this product")
end

And(/^I add another product to shopping basket$/) do
  common_screen.go_back_to_previous_screen
  product_listing_screen.product_listing.last.click
  product_listing_screen.product_listing.last.click
  product_landing_screen.click_add_to_bag_button
end

When(/^love a product from any brand$/) do
  go_to_product_shop_this_screen_from_brand_profile("1205")
  product_landing_screen.click_on_love_button
end

When(/^I go to "([^"]*)" product listing screen$/) do |brand|
  search_and_select_designer(brand)
  brand_screen.click_on_shop_button
  wait { expect(product_listing_screen.sort_button.displayed?).to be true }
end

And(/^I capture current love count from first product$/) do
  @current_product_total_love = product_listing_screen.capture_total_love_from_product
end

When(/^I love the first product from the list$/) do
  product_listing_screen.click_on_first_total_love_label
  wait { expect(lovers_screen.lovers_title.displayed?).to be true }
  lovers_screen.click_on_love_button_from_lovers_screen
  common_screen.go_back_to_previous_screen
  wait { expect(product_listing_screen.sort_button.displayed?).to be true }
end

Then(/^product love count has increased by one$/) do
  @new_product_total_love = product_listing_screen.capture_total_love_from_product
  expect(@new_product_total_love).to be > @current_product_total_love
end

And(/^I capture current comment count from first product$/) do
  @current_product_comment_count = product_listing_screen.capture_total_comment_from_product
end

When(/^I add comment to the product$/) do
  product_listing_screen.click_on_first_total_comment_label
  # product_landing_screen.click_on_product_comments_button
  wait { expect(comments_screen.comments_title.displayed?).to be true }
  comments_screen.enter_and_post_comment(generate_random_comments)
  common_screen.go_back_to_previous_screen
end

Then(/^product comment count has increased by one$/) do
  @new_product_comment_count = product_listing_screen.capture_total_comment_from_product
  expect(@new_product_comment_count).to be > @current_product_comment_count
end


When(/^I add style tribe member to product$/) do
  navigation_tab_bar_screen.click_on_explore_button
  explore_screen.click_on_designers_button
  sleep 2
  designer_screen.choose_brand_from_list("ACNE STUDIOS")
  product_listing_screen.click_on_first_product_image
  wait { expect(product_landing_screen.product_image.displayed?).to be true }
  product_landing_screen.select_product_link_cell("Add to Style Tribes")
  sleep 2
  style_tribes_screen.select_style_tribe_and_add_to_product
end

Then(/^check style tribe is added to the product$/) do
  style_tribe_name = style_tribes_screen.capture_style_tribe_name
  expect(style_tribe_name).to eq "Minimalist"
  added_by_text = style_tribes_screen.capture_added_by_style_tribe
  expect(added_by_text).to start_with "Added by"
end

And(/^capture first product price$/) do
  @before_sort_product_price = product_listing_screen.capture_first_product_price
end