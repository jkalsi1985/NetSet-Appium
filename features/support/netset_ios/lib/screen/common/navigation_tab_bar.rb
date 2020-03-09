module NetsetiOS
  module Screen
    module Common
      class NavigationTabBar < NetsetiOS::App

        element(:browse_button)          { find_element(:name, "feed") }
        element(:explore_button)         { find_element(:name, "explore") }
        element(:upload_button)          { find_element(:name, "upload") }
        element(:alerts_button)          { find_element(:name, "alerts") }
        element(:profile_button)         { find_element(:name, "profile") }

        def click_on_browse_button
          browse_button.click
          sleep 2
        end

        def click_on_explore_button
          explore_button.click
          sleep 2
        end

        def click_on_upload_button
          upload_button.click
          sleep 2
        end

        def click_on_alerts_button
          alerts_button.click
          sleep 2
        end

        def click_on_profile_button
          profile_button.click
          sleep 2
        end
      end
    end
  end
end