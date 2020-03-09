module NetsetiOS
  module Screen
    module Common
      module Actions

        def go_to_explore_and_close_tooltip
          navigation_tab_bar_screen.click_on_explore_button
          # close_tooltip_popup
        end

        def close_tooltip_popup
          wait { expect(common_screen.tooltip_view.displayed?).to be true }
          common_screen.click_tooltip_view
        end

        def close_location_tooltip
          begin
            common_screen.tooltip_view.displayed?
            close_tooltip_popup
          rescue Exception => e
            wait { expect(browse_feed_screen.menu_item_feed.displayed?).to be true }
            puts e.message
          ensure
            wait { expect(browse_feed_screen.menu_item_feed.displayed?).to be true }
          end
        end

        def go_to_profile_screen
          navigation_tab_bar_screen.click_on_profile_button
          begin
            profile_screen.capture_badge_total > 0
            # close_tooltip_popup
          rescue Exception => e
            expect(profile_screen.badges_button.displayed?).to be true
            puts e.message
          ensure
            expect(profile_screen.badges_button.displayed?).to be true
          end
        end

        def search_and_select_for_designer(designer_name)
          sleep 2
          select_tag_designer_screen.find_designer_search(designer_name)
          find_elements(:class, "UIACollectionCell").first.click
        end
      end
    end
  end
end

World(NetsetiOS::Screen::Common::Actions)