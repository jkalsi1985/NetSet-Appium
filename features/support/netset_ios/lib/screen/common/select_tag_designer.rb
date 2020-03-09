module NetsetiOS
  module Screen
    module Common
      class SelectTagDesigner < NetsetiOS::App

        element(:find_designer)            { find_element(:name, "search_field") }
        element(:cancel_designer_search)   { find_element(:name, "Cancel search button") }
        element(:designer_name)            { find_elements(:name, "Name label") }
        element(:designer_total_admirers)  { find_elements(:name, "Admirers label") }

        def find_designer_search(designer)
          find_designer.send_keys(designer)
        end

        def cancel_seach_for_designer
          cancel_designer_search.click
        end

        def tap_on_first_designer_label
          find_element(:name, "111Skin").click
        end

        def tap_on_second_designer_label
          find_element(:name, "1205").click
        end

        def tap_on_third_designer_label
          find_element(:name, "AERIN").click
        end
      end
    end
  end
end