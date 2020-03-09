module NetsetiOS
  module Screen
    module Common
      module Sections
        class SetupStepOneSection < NetsetiOS::App
          element(:step_one_title)           { find_element(:name, "Start building your love list") }
          element(:step_one_back_button)     { find_element(:name, "Step 1 back") }
          element(:step_one_forward_button)  { find_element(:name, "Step 1 forward") }
          element(:love_icon_button)         { find_element(:name, "Love icon") }
          element(:product_image)            { find_element(:name, "Product image") }
          element(:love_first_product)       { find_element(:xpath, "//UIAApplication[1]/UIAWindow[2]/UIACollectionView[1]/UIACollectionCell[1]/UIAButton[1]") }
          element(:double_tap_message)       { find_element(:name, "Double tap to love product") }
        end
      end
    end
  end
end

