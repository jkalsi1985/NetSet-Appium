module NetsetiOS
  module Screen
    module Common
      class ProductLanding < NetsetiOS::App

        element(:netset_title)              { find_element(:name, "netbook-title") }

        # Product image details
        element(:product_image)             { find_element(:name, "Image") }
        element(:love_button)               { find_element(:name, "Love button") }
        element(:product_total_loves)       { find_elements(:name, "Product total loves")[1] }
        element(:product_total_comments)    { find_element(:name, "Product page total comments") }
        element(:designer_name)             { find_elements(:name, "Product brand name")[1] }
        element(:product_name)              { find_element(:name, "Product details") }
        element(:product_size)              { find_element(:name, "Product size") }

        # Add to bag
        element(:size_help_button)          { find_element(:name, "Size help button") }
        element(:add_to_bag_button)         { find_element(:name, "Add to bag button") }
        element(:previous_price)            { find_element(:name, "Previous price label") }

        # Comment section
        element(:first_comment)             { find_elements(:name, "Comment 1 label")[1] }
        element(:second_comment)            { find_element(:name, "Comment 2 label") }
        element(:view_all_comments_button)  { find_element(:name, "View all comments button") }

        # Buttons
        element(:comments_button)           { find_elements(:name, "comment button")[1] }
        element(:share_button)              { find_element(:name, "share button") }

        def click_on_love_button
          love_button.click
        end

        def capture_brand_name
          designer_name.value
        end

        def capture_product_details
          product_name.value
        end

        def select_product_link_cell(link_cell)
          execute_script "mobile: scrollTo", :element => find_element(:name, "Style Ideas").ref
          find_element(:name, "#{link_cell}").click
        end

        def click_add_to_bag_button
          add_to_bag_button.click
        end

        def click_on_shopping_bag
          bag_button.click
        end

        def click_on_total_comments_button
          product_total_comments.click
        end

        def capture_current_comment_total
          product_total_comments.value.delete(" comments").to_i
        end

        def capture_first_product_comment
          execute_script "mobile: scrollTo", :element => find_element(:name, "Style Ideas").ref
          first_comment.value
        end

        def click_on_view_all_comments_button
          view_all_comments_button.click
        end

        def click_on_product_comments_button
          comments_button.click
        end
      end
    end
  end
end