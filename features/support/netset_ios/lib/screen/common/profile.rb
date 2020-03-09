module NetsetiOS
  module Screen
    module Common
      class Profile < NetsetiOS::App

        element(:profile_name)                   { find_elements(:name, "User name")[1] }
        element(:admirers_button)                { find_element(:name, "Total admirers button") }
        element(:admiring_button)                { find_element(:name, "Admiring list button") }
        element(:badges_button)                  { find_element(:name, "Total rewards button") }
        element(:admire_style_council_or_tribe)  { find_elements(:name, "find not admiring") }
        element(:unadmire_style_council_or_tribe){ find_elements(:name, "find admiring") }


        element(:edit_profile_button)            { find_element(:name, "Edit Profile") }
        element(:setting_button)                 { find_element(:name, "Settings") }
        element(:user_profile_bio)               { find_element(:name, "User Biography") }

        # Profile loves, photos and style tribes
        element(:loves_button)                   { find_element(:name, "Loves") }
        element(:photos_button)                  { find_element(:name, "Photos") }
        element(:style_tribe_button)             { find_element(:name, "Style Tribes") }
        element(:love_title_count)               { find_element(:name, "Loves count label") }
        element(:photos_title_count)             { find_element(:name, "Photos count label") }
        element(:style_tribe_title_count)        { find_element(:name, "Style Tribes count label") }

        element(:love_no_content_label)          { find_element(:name, "Loves no content label") }
        element(:style_tribe_no_content_label)   { find_element(:name, "Photos no content label") }
        element(:photos_no_content_label)        { find_element(:name, "Style Tribes no content label") }

        # Love table
        element(:profile_love_button)            { find_element(:name, "love button default") }
        element(:list_of_user_loved)             { find_elements(:name, "Style love button") }

        # Style tribe table
        element(:style_tribe_image)              { find_element(:name, "Profile style tribe total members") }
        element(:style_tribe_title)              { find_elements(:name, "Profile style tribe name") }
        element(:style_tribe_total_members)      { find_elements(:name, "Profile style tribe total members") }

        # Photo
        element(:list_of_uploaded_photos)        { find_elements(:name, "UGC photo content cell") }

        #Admiring screen
        element(:admiring_title)                  { find_element(:name, "ADMIRING") }
        element(:admirers_title)                  { find_element(:name, "ADMIRERS") }
        element(:admiring_back_button)            { find_element(:name, "back button") }
        element(:admiring_profile_image)          { find_element(:name, "Profile image") }
        element(:admiring_username)               { find_elements(:name, "Admiring username") }
        element(:admiring_name)                   { find_elements(:name, "Admiring name") }
        element(:admiring_list)                   { find_elements(:class, "UIACollectionCell") }
        element(:user_admire_another_user_image)  { find_elements(:name, "User admires another user") }
        element(:empty_admiring_list)             { find_element(:name, "You haven't admired anyone yet") }


        def click_on_photo_button
          photos_button.click
          sleep 2
        end

        def click_on_love_button
          loves_button.click
        end

        def click_on_style_tribe_button
          style_tribe_button.click
          sleep 2
        end

        def click_on_first_uploaded_photo
          list_of_uploaded_photos.first.click
          sleep 2
        end

        def click_on_admiring_button
          admiring_button.click
        end

        def click_on_admirers_button
          admirers_button.click
        end

        def current_style_tribe_total_members_on_profile
          first_style_tribe_total_members.value.delete(" Members").to_i
        end

        def click_love_button_from_love_table
          sleep 1
          profile_love_button.click
        end

        def click_on_admire_button
          admire_style_council_or_tribe.first.click
          sleep 2
        end

        def capture_current_admirers_total
          admirers_button.value.delete(" Admirers").to_i
        end

        def capture_style_tribe_name
          style_tribe_title.last.value
        end

        def select_last_style_tribe_from_table
          style_tribe_title.last.click
        end

        def click_on_settings_button
          setting_button.click
        end

        def find_admirers_username_from_list(admirers_username)
          halfsize = admiring_username.size / 2
          arr = admiring_username.to_a.drop(halfsize)
          arr.each { |row|
            a = row.value.include?(admirers_username)
            return a if a == true
          }
        end

        def find_admirers_name_from_list(admirers_name)
          halfsize = admiring_name.size / 2
          arr = admiring_name.to_a.drop(halfsize)
          arr.each { |row|
            a = row.value.include?(admirers_name)
            return a if a == true
          }
        end

        def capture_first_style_tribe_name_from_profile_screen
          halfsize = style_tribe_title.size / 2
          arr = style_tribe_title.to_a.drop(halfsize)
          arr.first.value
        end

        def capture_love_title_count
          love_title_count.value
        end

        def capture_photos_title_count
          photos_title_count.value
        end

        def capture_style_tribe_title_count
          style_tribe_title_count.value
        end

        def capture_no_love_content
          love_no_content_label.value
        end

        def capture_no_photos_content
          photos_no_content_label.value
        end

        def capture_no_style_tribe_content
          style_tribe_no_content_label.value
        end

        def capture_user_profile
          user_profile_bio.value
        end

        def click_bio_url
          user_profile_bio.click
        end

        def capture_badge_total
          badges_button.value.delete("\nBadge").to_i
        end

        def click_on_edit_profile_button
          edit_profile_button.click
        end
      end
    end
  end
end