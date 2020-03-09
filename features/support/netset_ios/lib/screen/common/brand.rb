module NetsetiOS
  module Screen
    module Common
      class Brand < NetsetiOS::App

        element(:brand_header)             { find_element(:xpath, "//UIAApplication[1]/UIAWindow[2]/UIANavigationBar[1]/UIAStaticText[1]") }
        element(:shop_button)              { find_element(:name, "SHOP") }
        element(:no_love_message)          { find_element(:name, "Looking for love!") }
        element(:no_photo_message )        { find_element(:name, "I'm working on it") }
        element(:no_style_tribe_message )  { find_element(:name, "Finding my Style Tribes..") }

        def click_on_shop_button
          shop_button.click
          sleep 1
        end
      end
    end
  end
end