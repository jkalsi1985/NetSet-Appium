module NetsetiOS
  module Screen
    module Common
      class Filters < NetsetiOS::App

        element(:filter_title)             { find_element(:name, "FILTERS") }
        element(:clear_all_button)         { find_element(:name, "Clear all button") }
        element(:apply_button)             { find_element(:name, "Apply button") }
        element(:total_browse_item_label)  { find_element(:name, "Total browse item label") }
        element(:category_count)           { find_elements(:name, "Category count") }
        element(:red_underline)            { find_element(:name, "Red underline") }
        element(:sold_out_toggle_button)   { find_element(:name, "Sold toggle button") }
        element(:selected_category)        { find_elements(:name, "Selected category") }
        element(:remove_selected_category) { find_elements(:name, "Remove selected category") }
        element(:close_button)             { find_element(:name, "close button") }

        # Designers
        element(:designer_title)           { find_element(:name, "DESIGNERS") }
        element(:designer_search_field)    { find_element(:name, "Designer search field") }
        element(:designer_cancel_button)   { find_element(:name, "Designer cancel button") }
        element(:back_button)              { find_element(:name, "back button") }

        def select_first_category(first_category)
          find_element(:name, "#{first_category}").click
        end

        def select_second_category(second_category)
          find_element(:name, "#{second_category}").click
        end

        def select_third_category(third_category)
          find_element(:name, "#{third_category}").click
        end

        def click_clear_all_button
          clear_all_button.click
        end

        def click_on_apply_button
          apply_button.click
        end

        def capture_total_browse_item
          total_browse_item_label.value
        end

        def click_sold_out_toggle_button
          sold_out_toggle_button.click
        end

        def search_for_designer(brand_name)
          designer_search_field.type(brand_name)
        end

        def select_a_designer(designer)
          find_element(:name, "#{designer}").click
        end

        def capture_selected_category(choosen_category)
          halfselectedcategory = selected_category.size / 2
          arr = selected_category.to_a.drop(halfselectedcategory)
          arr.each {|e|e.value.include?(choosen_category)}
        end

        def click_on_close_button
          close_button.click
        end
      end
    end
  end
end