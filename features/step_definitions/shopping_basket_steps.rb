Then(/^product is listed in shopping basket$/) do
  common_screen.click_on_shopping_bag_button
  expect((shopping_bag_screen.shopping_list).length).to eq(1)

  basket_brand_name = shopping_bag_screen.capture_shopping_designer_name
  basket_product_name = shopping_bag_screen.capture_shopping_product_title

  basket_brand_name.match @brand_name
  basket_product_name.match @product_name
end

When(/^I remove the product from the list$/) do
  shopping_bag_screen.swipe_to_remove_item
  shopping_bag_screen.click_on_remove_button
end

Then(/^shopping list is empty$/) do
  expect((shopping_bag_screen.shopping_list).length).to eq(0)
  expect(shopping_bag_screen.empty_bag_message.displayed?).to be true
end

And(/^go to shopping bag list$/) do
  common_screen.click_on_shopping_bag_button
end

Then(/^your shopping bag is empty message is displayed$/) do
  expect(shopping_bag_screen.empty_bag_message.displayed?).to be true
end

And(/^perform addition calculation on product price$/) do
  first_product_price = shopping_bag_screen.capture_first_product_price
  second_product_price = shopping_bag_screen.capture_second_product_price
  @total_price = first_product_price + second_product_price
end

Then(/^total price match to calculation/) do
  total_price = shopping_bag_screen.capture_total_purchase_price
  expect(total_price).to eq(@total_price)
end

And(/^click proceed to purchase button$/) do
  shopping_bag_screen.click_on_proceed_to_purchase_button
end

Then(/^goes to nap checkout process$/) do
  #This step we need to find element to check it goes to nap checkout process
  sleep 2
end