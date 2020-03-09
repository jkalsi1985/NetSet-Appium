module NetsetiOS
  module Screen
    module Common
      class Upload < NetsetiOS::App

        element(:upload_title)               { find_element(:name, "UPLOAD") }
        element(:camera_roll_button)         { find_element(:name, "Camera Roll") }
        element(:all_photos_button)          { find_element(:name, "All Photos") }
        element(:camera_icon_button)         { find_element(:name, "camera icon") }
        element(:list_of_camera_images)      { find_elements(:class, "UIACollectionCell") }

        # Move and scale screen
        element(:move_and_scale_title)       { find_element(:name, "MOVE AND SCALE") }
        element(:save_button)                { find_element(:name, "Save") }

        # Write comment on UGC
        element(:photo_uploaded_image)       { find_element(:name, "Photo image") }
        element(:write_your_caption_message) { find_elements(:name, "Caption text field")[1] }
        element(:add_style_tribes_message)   { find_element(:name, "Once you join a Style Tribe you’ll be able to share your photos directly with fellow members!") }
        element(:post_button)                { find_element(:name, "Post") }
        element(:update_button)              { find_element(:name, "Update") }

        # Add style tribe
        element(:add_style_tribe_to_ugc)     { find_element(:name, "Profile style tribe name") }

        # Access to camera pop up
        element(:ok_button)                  { find_element(:name, "OK") }

        # Tagging
        element(:add_tag_button)             { find_element(:name, "Tag a Product, Person or Designer") }
        element(:cancel_tag_button)          { find_element(:name, "Cancel tag button") }
        element(:tag_designer_button)        { find_element(:name, "Tag designer button") }
        element(:tag_product_button)         { find_element(:name, "Tag product button") }
        element(:tag_user_button)            { find_element(:name, "Tag user button") }
        element(:done_button)                { find_element(:name, "Done") }
        element(:tag_label)                  { find_elements(:name, "Tag label") }
        element(:tag_cancel)                 { find_elements(:name, "Tag cancel") }

        def assert_access_your_camera_popup
          wait = Selenium::WebDriver::Wait.new :timeout => 3
          wait.until { driver.find_element(:name, "“The NET SET” Would Like to Access the Camera").displayed? }
        end

        def close_upload_camera_and_photo_popup
          assert_access_your_camera_popup
          ok_button.click
          sleep 1
          ok_button.click
          wait = Selenium::WebDriver::Wait.new :timeout => 3
          wait.until { upload_title.displayed? }
        end

        def close_camera_popup
          assert_access_your_camera_popup
          ok_button.click
          sleep 1
          ok_button.click
        end

        def click_on_camera_roll_button
          camera_roll_button.click
        end

        def select_and_click_first_camera_image
          list_of_camera_images.first.click
        end

        def click_on_move_and_scale_save_button
          save_button.click
        end

        def click_on_ugc_post_button
          post_button.click
        end

        def enter_your_caption_message(message)
          write_your_caption_message.click
          write_your_caption_message.send_keys(message)
          execute_script 'mobile: tap', :x => 200, :y => 100, :fingers => 1, :tapCount => 1, :duration => 0.6
        end

        def add_style_tribe
          add_style_tribe_to_ugc.click
        end

        def click_all_photo_text
          all_photos_button.click
        end

        def click_add_tag_button
          add_tag_button.click
          sleep 2
        end

        def tag_designer_button
          find_element(:name, "Tag designer button").click
          sleep 2
        end

        def tag_product_button
          find_element(:name, "Tag product button").click
          sleep 2
        end

        def tag_user_button
          find_element(:name, "Tag user button").click
          sleep 2
        end

        def cancel_tag_button
          cancel_tag_button.click
        end

        def click_to_tag_designer
          click_add_tag_button
          execute_script 'mobile: tap', :x => 150, :y => 150, :fingers => 1, :tapCount => 1, :duration => 0.6
          sleep 2
          find_element(:name, "Tag designer button").click
          sleep 5
        end

        def tap_on_middle_of_photo
          execute_script 'mobile: tap', :x => 200, :y => 200, :fingers => 1, :tapCount => 1, :duration => 0.6
          sleep 2
        end

        def click_to_tag_product
          click_add_tag_button
          execute_script 'mobile: tap', :x => 200, :y => 200, :fingers => 1, :tapCount => 1, :duration => 0.6
          sleep 2
          find_element(:name, "Tag product button").click
        end

        def click_to_tag_user
          click_add_tag_button
          execute_script 'mobile: tap', :x => 200, :y => 200, :fingers => 1, :tapCount => 1, :duration => 0.6
          sleep 2
          find_element(:name, "Tag user button").click
        end

        def click_on_done_button
          done_button.click
        end

        def capture_first_tag_value
          tag_label[1].value
        end

        def capture_second_tag_value
          tag_label[2].value
        end

        def capture_third_tag_value
          tag_label[3].value
        end

        def capture_fourth_tag_value
          tag_label[4].value
        end

        def cancel_first_tag
          tag_cancel.first.click
        end

        def remove_first_tag
          tag_cancel.first.click
        end

        def click_on_update_button
          update_button.click
        end
      end
    end
  end
end
