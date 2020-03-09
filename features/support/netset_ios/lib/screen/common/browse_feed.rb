module NetsetiOS
  module Screen
    module Common
      class BrowseFeed < NetsetiOS::App

        attr_accessor :product_brand, :product_description, :price_of_product, :user_profile_name, :caption_message

        element(:menu_item_feed)               { find_element(:name, "NBFeedView") }
        element(:list_of_feeds)                { find_elements(:class, "UIACollectionCell") }

        # Feed Header
        element(:username_on_feed)             { find_elements(:name, "Username")[0] }
        element(:timestamp_on_feed)            { find_elements(:name, "Timestamp")[0] }
        element(:feed_love_button)             { find_elements(:name, "Love button default")[0] }
        element(:total_loves)                  { find_elements(:name, "Total love")[2] }
        element(:total_comments)               { find_elements(:name, "Total comments")[2] }

        # Content feed
        element(:content_image)                { find_elements(:name, "Content image") }
        element(:ugc_caption_message)          { find_element(:name, "UGC caption message") }
        element(:we_have_style_ideas_text)     { find_elements(:name, "We have style ideas for you")[1] }
        element(:no_admires_message)           { find_element(:name, "You are not admiring anyone yet. Search and discover people and brands to admire") }

        # Product feed
        element(:product_image)                { find_element(:name, "Product image") }
        element(:feed_designer_name)           { find_elements(:name, "Product designer name") }
        element(:feed_product_details)         { find_elements(:name, "Product details") }
        element(:feed_product_price)           { find_elements(:name, "Product price") }

        # Comments
        element(:first_comment)                { find_elements(:name, "Comment 1 label") }
        element(:second_comment)               { find_elements(:name, "Comment 2 label") }
        element(:third_comment)                { find_elements(:name, "Comment 3 label") }
        element(:view_all_comments_button)     { find_elements(:name, "View all comments button") }

        # Buttons
        element(:comments_button)              { find_element(:name, "Comment button") }
        element(:apply_button)                 { find_element(:name, "Apply") }
        element(:style_ideas_button)           { find_elements(:name, "Style ideas button") }
        element(:buy_it_now_button)            { find_elements(:name, "Buy it now button") }

        # More option
        element(:more_button)                  { find_elements(:name, "More button")[0] }
        element(:hide_user_option)             { find_element(:name, "Hide user from my feed") }
        element(:report_option)                { find_element(:name, "Report") }
        element(:cancel_option)                { find_element(:name, "Cancel") }
        element(:ok_option)                    { find_element(:name, "OK") }
        element(:edit_option)                  { find_element(:name, "Edit") }


        def click_on_love_button
          feed_love_button.click
        end

        def click_on_first_comment_on_this_button
          comments_button.click
        end

        def click_on_style_ideas_button
          style_ideas_button.first.click
        end

        def click_on_buy_it_now_button
          buy_it_now_button.first.click
        end

        def click_on_first_content_loves_link
          total_loves.first.click
        end

        def click_on_first_content_comments_link
          total_comments.click
        end

        def capture_first_feed_product_details
          @product_brand = product_brand_name.value
          @product_description = product_detail.value
          @price_of_product = product_price.value
          return @product_brand,@product_description,@price_of_product
        end

        def capture_ugc_caption_message
          execute_script "mobile: scrollTo", :element => find_elements(:name, "comment button").first.ref
          @caption_message = ugc_caption_message.value
        end

        def click_on_view_all_comments_button
          view_all_comments_button.first.click
        end

        def capture_profile_username
          @user_profile_name = username_on_feed.value
          return @user_profile_name
        end
        #
        # def click_on_first_product_image
        #   execute_script 'mobile: tap', :x => 174, :y => 474, :fingers => 1, :tapCount => 1, :duration => 0.6
        #   sleep 2
        # end

        def tap_on_hastag_sign_in_comment
          execute_script 'mobile: tap', :x => 150, :y => 639, :fingers => 1, :tapCount => 1, :duration => 0.5
        end

        def tap_on_username_in_comment
          sleep 1
          execute_script 'mobile: tap', :x => 150, :y => 639, :fingers => 1, :tapCount => 1, :duration => 0.5
        end

        def assert_style_ideas_banner
          list_of_feeds.each { |row|
            a = row.value.include?(we_have_style_ideas_text)
            return a if a == true
          }
        end

        def capture_first_total_comments
          total_comments.value
        end

        def capture_first_total_love
          total_loves.value
        end

        def capture_first_content_comment
          first_comment.first.value
        end

        def capture_second_content_comments
          halfsecondcomments = second_comment.size / 2
          arr = second_comment.to_a.drop(halfsecondcomments)
          arr.first.value
        end

        def assert_first_comment_displayed
          first_comment.first.displayed?
        end

        def capture_view_all_comments
          view_all_comments_button.value
        end

        def click_first_love_total_button
          total_loves.click
        end

        def click_first_comment_total_button
          total_comments.click
        end

        def tap_on_feed_filter
          execute_script 'mobile: tap', :x => 0, :y => 70, :fingers => 1, :tapCount => 1, :duration => 0.5
        end

        def select_from_everyone_option_list(everyone_option)
          find_element(:name, "#{everyone_option}").click
        end

        def select_from_everything_option_list(everything_option)
          find_element(:name, "#{everything_option}").click
        end

        def click_on_filter_apply_button
          apply_button.click
          sleep 1
        end

        def capture_first_content_username
          username_on_feed.value
        end

        def click_on_more_option
          more_button.click
          sleep 1
        end

        def click_to_edit_ugc_content
          click_on_more_option
          sleep 1
          edit_option.click
        end

        def assert_are_you_sure_popup
          wait = Selenium::WebDriver::Wait.new :timeout => 3
          wait.until { driver.find_element(:name, "ARE YOU SURE?").displayed? }
        end

        def assert_report_content_popup
          wait = Selenium::WebDriver::Wait.new :timeout => 3
          wait.until { driver.find_element(:name, "Report Content").displayed? }
        end

        def assert_and_click_on_user_hidden_popup
          wait = Selenium::WebDriver::Wait.new :timeout => 3
          wait.until { driver.find_element(:name, "User Hidden").displayed? }
          # ok_option.click
        end

        def assert_and_click_on_thankyou_popup
          wait = Selenium::WebDriver::Wait.new :timeout => 3
          wait.until { driver.find_element(:name, "Thank you").displayed? }
          # ok_option.click
        end

        def hide_user_from_feed
          click_on_more_option
          hide_user_option.click
        end

        def report_content_problem
          click_on_more_option
          report_option.click
        end

        def find_and_click_on_sale_products
          halfsize = shop_button.size / 2
          arr = shop_button.to_a.drop(halfsize)
          arr.each { |row|
            a = row.value.include?("On Sale")
            return a if a == true
          }
          arr.first.click
        end

        def click_on_first_content_image
          content_image.first.click
        end
      end
    end
  end
end