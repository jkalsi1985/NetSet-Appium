module NetsetiOS
  module Screen
    module Common
      class Explore < NetsetiOS::App

        element(:netbook_title)             { find_element(:name, "netbook-title") }
        element(:find_title)                { find_element(:name, "Find") }
        element(:discover_title)            { find_element(:name, "Discover") }

        # Search
        element(:search_title)              { find_element(:name, "SEARCH") }
        element(:find_search_button)        { find_element(:name, "search button") }
        element(:search_field)              { find_element(:name, "search_field") }
        element(:user_search_results)       { find_elements(:name, "Name label") }

        element(:search_cancel_button)      { find_element(:name, "Search cancel button") }
        element(:find_designer_message)     { find_element(:name, "Find designer or products message") }
        element(:search_back_button)        { find_element(:name, "back button") }
        element(:search_result_cell)        { find_elements(:name, "Style image") }

        # Find options
        element(:style_tribe_button)        { find_element(:name, "STYLE TRIBES") }
        element(:popular_button)            { find_element(:name, "POPULAR") }
        element(:people_button)             { find_element(:name, "PEOPLE") }
        element(:designers_button)          { find_element(:name, "DESIGNERS A-Z") }
        element(:whats_new_button)          { find_element(:name, "WHAT'S NEW") }
        element(:show_or_hide_tags_button)  { find_elements(:name, "Show or hide tag button") }

        # Discover
        element(:list_of_promos)            { find_elements(:class, "UIACollectionCell") }

        #Style council
        element(:list_of_style_council)     { find_elements(:class, "UIACollectionView") }

        def click_on_find_search_button
          find_search_button.click
          sleep 1
        end

        def search_for_neset(value)
          search_field.click
          search_field.send_keys(value)
        end

        def click_to_cancel_search_button
          search_cancel_button.click
        end

        def click_on_style_tribe_button
          style_tribe_button.click
        end

        def click_on_popular_button
          popular_button.click
        end

        def click_on_people_button
          people_button.click
        end

        def click_on_designers_button
          designers_button.click
        end

        def choose_any_find_option(option)
          execute_script "mobile: scrollTo", :element => find_element(:name, "SUMMER SHOP").ref
          find_element(:name, "#{option}").click
          sleep 2
        end

        def click_on_first_promo
          list_of_promos.first.click
        end

        def click_on_search_result_cell(search_result_name)
          find_element(:name, "#{search_result_name}").click
          sleep 2
        end

        def select_result_tab(search_tab)
          find_element(:name, "#{search_tab}").click
          sleep 2
        end

        def tap_on_show_or_hide_button
          show_or_hide_tags_button.first.click
          sleep 5
        end

        def tap_on_first_user_from_search_result
          find_element(:name, "Jag Testing").click
        end

        def select_first_style_council
          list_of_style_council[0].click
        end
      end
    end
  end
end