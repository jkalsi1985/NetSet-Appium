module NetsetiOS
  module Screen
    module Common
      class Designer < NetsetiOS::App

        element(:designer_title)           { find_element(:name, "DESIGNER A-Z") }
        element(:designer_search_field)    { find_element(:name, "search_field") }
        element(:designer_cancel_button)   { find_element(:name, "Search cancel button") }
        element(:designer_admire_button)   { find_elements(:name, "find not admiring") }
        element(:desiger_name_label)       { find_elements(:name, "Name label") }

        def search_for_designer(designer)
            designer_search_field.send_keys(designer)
        end

        def click_on_to_admire_designer
          designer_admire_button.first.click
        end

        def click_on_designer_label
          desiger_name_label.first.click
        end

        def clear_designer_text_in_search_bar
          designer_cancel_button.click
        end

        def search_and_select_designer(designer)
          search_for_designer(designer)
          click_on_designer_label
        end

        def cancel_search
          designer_cancel_button.click
        end

      end
    end
  end
end