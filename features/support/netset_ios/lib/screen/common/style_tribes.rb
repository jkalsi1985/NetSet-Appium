module NetsetiOS
  module Screen
    module Common
      class StyleTribes < NetsetiOS::App

        attr_accessor :double_denim_total_members, :rock_chic_total_members

        element(:style_tribes_title)          { find_element(:name, "STYLE TRIBES") }
        element(:collection_of_style_tribe)   { find_elements(:class, "UIACollectionCell") }
        element(:style_tribe_images)          { find_elements(:name, "Style tribe image") }
        element(:style_tribe_names)           { find_elements(:name, "Style tribe name") }
        element(:style_tribe_total_members)   { find_elements(:name, "Style tribe total members") }

        # Style tribe screen
        element(:style_tribe_profile_image)   { find_element(:name, "Style tribe profile image") }
        element(:style_tribe_members_count)   { find_elements(:name, "Total-of-members-or-admirers") }
        element(:join_style_tribe_button)     { find_elements(:name, "content view follow button") }
        element(:member_button)               { find_element(:name, "Join tribe button") }
        element(:style_tribe_bio)             { find_element(:name, "Style tribe bio") }

        # Add to your style tribe
        element(:add_style_tribe_title)       { find_elements(:name, "Profile style tribe name")[1] }
        element(:added_by_text)               { find_element(:name, "Profile style tribe total members") }
        element(:add_button)                  { find_element(:name, "Add") }


        def capture_double_denim_total_members
          @double_denim_total_members = double_denim_total_members.value
          return @double_denim_total_members
        end

        def current_style_tribe_total_members
          style_tribe_members_count.first.value.delete(" Members").to_i
        end

        def click_on_first_style_tribe
          style_tribe_names.first.click
        end

        def click_on_double_denim_style_tribe
          double_denim_style_tribe_button.click
        end

        def click_on_join_tribe_button
          join_style_tribe_button.first.click
        end

        def click_on_style_button
          style_button.click
        end

        def click_on_shop_button
          shop_button.click
        end

        def select_style_tribe_and_add_to_product
          add_style_tribe_title.click
          click_on_add_button
        end

        def click_on_add_button
          add_button.click
          sleep 2
        end

        def capture_style_tribe_name
          add_style_tribe_title.value
        end

        def capture_added_by_style_tribe
          added_by_text.value
        end

        def click_on_member_button
          member_button.click
        end
      end
    end
  end
end