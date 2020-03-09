module NetsetiOS
  module Screen
    module Common
      class EditProfile < NetsetiOS::App

        element(:edit_profile_title)              { find_element(:name, "EDIT PROFILE") }
        element(:name_field)                      { find_element(:name, "Profile name field") }
        element(:username_field)                  { find_element(:name, "Profile username field") }
        element(:user_bio_field)                  { find_element(:name, "Profile user bio field") }
        element(:edit_profile_image)              { find_element(:name, "Edit profile photo") }
        element(:edit_background_image)           { find_element(:name, "Edit profile background image") }
        element(:save_button)                     { find_element(:name, "Save") }
        element(:cancel_button)                   { find_element(:name, "Cancel") }
        element(:close_edit_profile_button)       { find_element(:name, "close button") }

        # Tell us more about you
        element(:tell_us_more_about_you_button)   { find_element(:name, "Tell us more about you button") }
        element(:list_of_different_skin_tone)     { find_elements(:name, "Skin color button") }
        element(:red_line_selected)               { find_element(:name, "Red line") }
        element(:birthday_field)                  { find_element(:class, "UIATextField") }
        element(:date_picker_done_button)         { find_element(:name, "Done") }

        def edit_name_on_profile(profile_name)
          name_field.click
          name_field.type(profile_name)
        end

        def edit_username_on_profile(profile_username)
          username_field.click
          username_field.type(profile_username)
        end

        def edit_bio_on_profile(profile_bio)
          user_bio_field.click
          user_bio_field.type(profile_bio)
        end

        def capture_username_from_edit_profile
          username_field.value
        end

        def click_on_save_button
          save_button.click
        end

        def click_on_cancel_button
          cancel_button.click
        end

        def click_close_button_on_edit_profile
          close_edit_profile_button.click
        end

        def click_to_edit_profile_image
          edit_profile_image.click
        end

        def click_to_edit_background_image
          edit_background_image.click
        end

        def select_dress_size(dress_size)
          find_element(:name, "#{dress_size}").click
        end

        def select_shoe_size(shoe_size)
          find_element(:name, "#{shoe_size}").click
        end

        def select_skin_type(skin_type)
          find_element(:name, "#{skin_type}").click
        end

        def select_skin_tone
          list_of_different_skin_tone.last.click
        end

        def save_edit_profile_and_close
          click_on_save_button
          click_close_button_on_edit_profile
        end

        def cancel_edit_profile_and_close
          click_on_cancel_button
          click_close_button_on_edit_profile
        end

        def fill_in_tell_us_about_you_section(dress_size,shoe_size,skin_type,birthday)
          execute_script "mobile: scrollTo", :element => find_element(:name, "Birthday").ref
          select_dress_size(dress_size)
          select_shoe_size(shoe_size)
          select_skin_type(skin_type)
          select_birthday_dates(birthday)
          select_skin_tone
        end

        def select_birthday_dates(birthday)
          birthday_field.click
          birthday_field.type(birthday)
        end

        def capture_birthday
          birthday_field.value
        end
      end
    end
  end
end