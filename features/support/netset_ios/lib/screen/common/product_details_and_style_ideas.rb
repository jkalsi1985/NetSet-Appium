module NetsetiOS
  module Screen
    module Common
      class ProductDetailsAndStyleIdeas < NetsetiOS::App

        element(:product_details_title)    { find_element(:name, "PRODUCT DETAILS") }
        element(:netset_title)             { find_element(:name, "netbook-title") }

        # Product details
        element(:product_image)            { find_element(:name, "Product image") }
        element(:product_designer_name)    { find_element(:name, "Product brand name") }
        element(:product_details)          { find_element(:name, "Product title") }
        element(:product_price)            { find_element(:name, "Product price") }
        element(:product_love_button)      { find_element(:name, "Style ideas love button") }

        # Add to bag
        element(:size_help_button)         { find_element(:name, "Size help button") }
        element(:add_to_bag_button)        { find_element(:name, "Add to bag button") }
        element(:original_price)           { find_element(:name, "Previous price label") }

        # Style ideas
        element(:style_ideas_matches)       { find_elements(:name, "UGC photo content cell")[1] }

        def capture_product_brand_name
          product_designer_name.value
        end

        def capture_product_details
          product_details.value
        end

        def capture_product_price
          product_price.value
        end

        def click_product_love_button
          product_love_button.click
        end

        def click_add_to_bag
          add_to_bag_button.click
        end

        def click_on_style_matches_images
          style_ideas_matches.first.click
        end
      end
    end
  end
end