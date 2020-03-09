module NetsetiOS
  module Screen
    module Common
      module Actions

        def search_and_select_for_brand(brand_name)
          explore_screen.choose_any_find_option("DESIGNER A-Z")
          wait { expect(designer_screen.designer_title.displayed?).to be true }
          designer_screen.search_and_select_designer(brand_name)
        end

        def search_select_and_admire_brand(brand_name)
          designer_screen.search_and_select_designer(brand_name)
          sleep 1
          profile_screen.click_on_edit_profile_button
          common_screen.go_back_to_previous_screen
          common_screen.go_back_to_previous_screen
          explore_screen.choose_any_find_option("DESIGNER A-Z")
          wait { expect(designer_screen.designer_title.displayed?).to be true }
        end

        def search_for_something(value)
          explore_screen.click_on_find_search_button
          explore_screen.search_for_neset(value)
          sleep 2
        end
      end
    end
  end
end

World(NetsetiOS::Screen::Common::Actions)