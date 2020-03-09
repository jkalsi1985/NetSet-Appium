module NetsetiOS
  module Screen
    module Common
      class Comments < NetsetiOS::App

        attr_accessor :first_comment

        element(:comments_title)              { find_element(:name, "COMMENTS") }

        # UGC photo
        element(:ugc_photo)                   { find_element(:name, "ugc photo image") }
        element(:ugc_caption_message)         { find_element(:name, "ugc caption message") }

        # Product details
        element(:product_image)               { find_element(:name, "Product image") }


        element(:product_title)               { find_element(:name, "Product title") }
        element(:product_brand_name)          { find_element(:name, "Product brand name") }
        element(:product_price)               { find_element(:name, "Product price") }

        # Comment section
        element(:load_more_comments_button)   { find_element(:name, "Load more comments button") }
        element(:comment_username)            { find_elements(:class, "UIAButton")[2] }
        element(:comments)                    { find_elements(:name, "Total comments") }
        element(:comments_timestamp)          { find_elements(:name, "Comment timestamp") }
        element(:list_of_comments)            { find_elements(:name, "List of comments") }
        element(:no_comment_right_now_message){ find_element(:name, "We can't load the comments right now") }

        # Bordered View
        element(:write_your_comment_field)    { find_element(:name, "Comment field") }
        element(:post_button)                 { find_element(:name, "Post button") }
        element(:delete_button)               { find_elements(:name, "Delete") }
        element(:reply_button)                { find_elements(:name, "Reply") }

        # Confirm pop up
        element(:ok_button)                   { find_element(:name, "OK") }
        element(:cancel_buton)                { find_element(:name, "Cancel") }

        def assert_confirm_delete_pop_up
          wait = Selenium::WebDriver::Wait.new :timeout => 5
          wait.until { driver.find_element(:name, "Confirm delete").displayed? }
          driver.find_element(:name, "Your message will be permanently removed from The NET SET").displayed?
          ok_button.displayed?
          cancel_buton.displayed?
        end

        def enter_your_comment(comment)
          write_your_comment_field.send_keys(comment)
        end

        def click_on_your_post_button
          post_button.click
        end

        def enter_and_post_comment(comment)
          enter_your_comment(comment)
          click_on_your_post_button
          wait = Selenium::WebDriver::Wait.new :timeout => 10
          wait.until { comments_title.displayed? }
        end

        def delete_first_comment
          delete_button.first.click
          # assert_confirm_delete_pop_up
          # ok_button.click
        end

        def delete_last_comment
          delete_button.last.click
          # assert_confirm_delete_pop_up
          # ok_button.click
        end

        def capture_first_comment
          half_list_of_comments = list_of_comments.size / 2
          arr = list_of_comments.to_a.drop(half_list_of_comments)
          @first_comment = arr.first.value
          return @first_comment
        end

        def click_ugc_image_in_comments_screen
          ugc_photo.click
          sleep 2
        end

        def click_first_reply_button
          reply_button.first.click
        end
      end
    end
  end
end
