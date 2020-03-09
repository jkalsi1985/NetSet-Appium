module NetsetiOS
  module Screen
    module Common
      class ShoppingBag < NetsetiOS::App

        element(:close_button)               { find_element(:name, "close button") }
        element(:shopping_bag_title)         { find_element(:name, "SHOPPING BAG") }
        element(:empty_bag_message)          { find_element(:name, "Empty bag message") }
        element(:designer_name)              { find_elements(:name, "Designer name") }
        element(:product_title)              { find_elements(:name, "Product title") }
        element(:product_price)              { find_elements(:name, "Product price") }
        element(:product_size)               { find_elements(:name, "Product size") }
        element(:shopping_list)              { find_elements(:class, "UIATableCell") }
        element(:total_price)                { find_element(:name, "Total purchase price") }
        element(:tax_and_shipping_label)     { find_element(:name, "Tax and shipping label") }
        element(:proceed_to_purchase_button) { find_element(:name, "Proceed to purchase button") }
        element(:remove_button)              { find_element(:name, "Remove") }

        def click_on_close_button
          close_button.click
        end

        def capture_shopping_designer_name
          designer_name.last.value
        end

        def capture_shopping_product_title
          product_title.first.value
        end

        def capture_shopping_product_size
          product_size.first.value
        end

        def click_on_proceed_to_purchase_button
          proceed_to_purchase_button.click
        end

        def click_on_remove_button
          remove_button.click
        end

        def swipe_to_remove_item
          execute_script "mobile: scrollTo", :element => find_element(:name, "Remove").ref
        end

        def capture_total_purchase_price
          total_price.value.delete("Total £").to_i
        end

        def capture_first_product_price
          product_price.first.value.delete("£").to_i
        end

        def capture_second_product_price
          product_price.last.value.delete("£").to_i
        end
      end
    end
  end
end