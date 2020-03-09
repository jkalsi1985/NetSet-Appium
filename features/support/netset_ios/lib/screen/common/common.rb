module NetsetiOS
  module Screen
    module Common
      class Common < NetsetiOS::App

        element(:back_button)              { find_element(:name, "back button") }
        element(:shopping_bag_button)      { find_element(:name, "bag-button") }
        element(:tooltip_view)             { find_element(:name, "tooltip-view") }

        def go_back_to_previous_screen
          back_button.click
          sleep 2
        end

        def click_on_shopping_bag_button
          shopping_bag_button.click
        end

        def click_tooltip_view
          tooltip_view.click
        end

        def click_tooltip_description
          tooltip_description.click
        end

        def capture_tooltip_description
          tooltip_description.value
        end

      end
    end
  end
end