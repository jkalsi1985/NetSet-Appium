module NetsetiOS
  module Screen
    module Common
      class OnboardingAndWelcome < NetsetiOS::App

        element(:netset_intro_message)          { find_element(:name, "Netset intro message") }
        element(:sign_in_button)                { find_element(:name, "Sign in with your account") }
        element(:register_button)               { find_element(:name, "Register for a new account") }

        #Onboarding screen
        element(:skip_button)                   { find_element(:name, "Skip button") }
        element(:share_and_shop_text)           { find_element(:name, "Share and shop with the world’s most stylish women") }
        element(:what_other_people_loving_text) { find_element(:name, "See what other people are loving") }
        element(:shop_everything_text)          { find_element(:name, "Shop everything you see") }
        element(:join_style_tribe_text)         { find_element(:name, "Join style tribe to discover like minded people") }

        #Pop up notification and location access
        element(:allow_button)                  { find_element(:name, "Allow") }
        element(:dont_allow_button)             { find_element(:name, "Don’t Allow") }
        element(:ok_button)                     { find_element(:name, "OK") }

        #App update
        element(:take_me_to_app_store_button)   { find_element(:name, "TAKE ME TO THE APP STORE") }
        element(:i_will_do_this_later_button)   { find_element(:name, "I'LL DO THIS LATER") }


        def assert_access_your_location_popup
          wait = Selenium::WebDriver::Wait.new :timeout => 5
          wait.until { driver.find_element(:name, "“The NET SET” Would Like to Send You Notifications").displayed? }
          dont_allow_button.displayed?
          ok_button.displayed?
        end

        def click_on_sign_in_button
          sign_in_button.click
        end

        def click_on_register_button
          register_button.click
        end

        def close_the_notification_and_location_popups
          assert_access_your_location_popup
          ok_button.click
        end

        def click_to_skip_onboarding_screen
          skip_button.click
        end

        def click_on_i_will_this_later_app_button
          execute_script 'mobile: tap', :x => 60, :y => 448.6666666666667, :fingers => 1, :tapCount => 1, :duration => 0.5
        end

        def click_take_me_to_app_store_button
          take_me_to_app_store_button.click
        end
      end
    end
  end
end
