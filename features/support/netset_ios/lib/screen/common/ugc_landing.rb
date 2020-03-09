module NetsetiOS
  module Screen
    module Common
      class UgcLanding < NetsetiOS::App

        element(:ugc_timestamp)             { find_element(:name, "ugc timestamp") }
        element(:ugc_username)              { find_elements(:name, "ugc username")[1] }
        element(:ugc_love_button)           { find_element(:name, "ugc love button") }
        element(:more_option_button)        { find_element(:name, "More button") }
        element(:delete_option_button)      { find_element(:name, "Delete") }

        element(:cancel_option_button)      { find_element(:name, "Cancel") }
        element(:report_option_button)      { find_element(:name, "Report") }
        element(:hide_user_option)          { find_element(:name, "Hide user from my feed") }

        # iPhone only
        element(:ugc_total_loves)           { find_elements(:name, "ugc total loves")[1] }
        element(:ugc_total_comments)        { find_element(:name, "ugc total comments") }

        # Image view
        element(:ugc_image_view)            { find_element(:name, "ugc photo image") }
        element(:ugc_caption_message)       { find_element(:name, "ugc caption message") }

        # Buttons
        element(:comments_button)           { find_elements(:name, "comment button")[1] }
        element(:share_button)              { find_element(:name, "share button") }
        element(:add_to_your_style_tribe)   { find_element(:name, "Add to Style Tribes") }

        # pop up option
        element(:ok_button)                 { find_element(:name, "OK") }
        element(:cancel_button)             { find_element(:name, "Cancel") }

        # Add to your style tribe screen
        element(:style_tribe_title)         { find_elements(:name, "Profile style tribe name")[1] }
        element(:who_added_style_tribe)     { find_element(:name, "Profile style tribe total members") }

        def click_on_more_option_button
          more_option_button.click
        end

        def click_on_more_option_and_delete
          click_on_more_option_button
          sleep 1
          delete_option_button.click
          sleep 3
        end

        def click_on_more_option_and_cancel
          click_on_more_option_button
          sleep 2
          cancel_option_button.click
        end

        def click_on_more_option_and_edit
          click_on_more_option_button
          sleep 2
          edit_option_button.click
        end

        def assert_delete_ugc_popup
          wait = Selenium::WebDriver::Wait.new :timeout => 3
          wait.until { driver.find_element(:name, "Delete").displayed? }
          driver.find_element(:name, "Are you sure you want to delete your photo?").displayed?
          ok_button.displayed?
          cancel_button.displayed?
        end

        def click_on_love_button
          love_button.click
        end

        def click_on_add_to_your_style_tribe_button
          add_to_your_style_tribe.click
          sleep 2
        end

        def assert_are_you_sure_popup
          wait = Selenium::WebDriver::Wait.new :timeout => 3
          wait.until { driver.find_element(:name, "ARE YOU SURE?").displayed? }
        end

        def hide_user_from_ugc_landing_screen
          click_on_more_option_button
          hide_user_option.click
        end
      end
    end
  end
end