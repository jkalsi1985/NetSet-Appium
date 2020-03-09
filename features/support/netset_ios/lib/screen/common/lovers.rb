module NetsetiOS
  module Screen
    module Common
      class Lovers < NetsetiOS::App

        element(:lovers_title)                    { find_element(:name, "LOVERS") }
        element(:lovers_love_button)              { find_element(:name, "Style ideas love button") }

        element(:list_of_loved_content)           { find_elements(:class, "UIACollectionCell") }
        element(:list_of_username_loved_content)  { find_elements(:name, "Admiring username") }
        element(:list_of_users_loved_content)     { find_elements(:name, "Admiring name") }
        element(:ugc_photo_image)                 { find_element(:name, "ugc photo image") }
        element(:ugc_photo_caption)               { find_element(:name, "ugc caption message") }

        def click_ugc_photo_image
          ugc_photo_image.click
        end

        def find_last_username_loved_content(last_user)
          halfsize = list_of_username_loved_content.size / 2
          arr = list_of_username_loved_content.to_a.drop(halfsize)
          arr.each { |row|
            a = row.value.include?(last_user)
            return a if a == true
          }
        end

        def find_last_user_loved_content(last_user)
          halfsize = list_of_users_loved_content.size / 2
          arr = list_of_users_loved_content.to_a.drop(halfsize)
          arr.each { |row|
            a = row.value.include?(last_user)
            return a if a == true
          }
        end

        def click_on_love_button_from_lovers_screen
          lovers_love_button.click
        end
      end
    end
  end
end