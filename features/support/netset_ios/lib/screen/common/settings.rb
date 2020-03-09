module NetsetiOS
  module Screen
    module Common
      class Settings < NetsetiOS::App

        element(:invite_friends_button)       { find_element(:name, "INVITE FRIENDS") }
        element(:country_selection_button)    { find_element(:name, "COUNTRY SELECTION") }
        element(:feedback_button)             { find_element(:name, "FEEDBACK") }
        element(:help_button)                 { find_element(:name, "HELP") }
        element(:my_orders_button)            { find_element(:name, "MY ORDERS") }
        element(:credits_button)              { find_element(:name, "CREDITS") }
        element(:sign_out_button)             { find_element(:name, "SIGN OUT") }

        # Invite friends
        element(:invite_friends_title)        { find_element(:name, "INVITE FRIENDS") }
        element(:welcome_message)             { find_element(:name, "Welcome message") }
        element(:friends_name_field)          { find_element(:name, "Friends name field") }
        element(:name_of_contacts)            { find_element(:name, "Name of contact") }
        element(:contact_list)                { find_elements(:name, "Contacts") }
        element(:invite_button)               { find_element(:name, "Invite button") }
        element(:invite_error_message)        { find_element(:name, "Please enter a friend's phone number or email address") }

        # Feedback
        element(:feedback_title)              { find_element(:name, "FEEDBACK") }
        element(:feedback_message)            { find_element(:name, "Feedback message") }

        # Country selection
        element(:feedback_title)              { find_element(:name, "COUNTRY SELECTION") }
        element(:current_country)             { find_element(:name, "Current country") }
        element(:choose_country_message)      { find_element(:name, "Change country list below") }
        element(:filter_country_field)        { find_element(:name, "Filter country field") }
        element(:country_list)                { find_elements(:name, "Country list") }

        # Pop up buttons
        element(:ok_button)                   { find_element(:name, "OK") }
        element(:dont_allow_button)           { find_element(:name, "Don't Allow") }
        element(:cancel_button)               { find_element(:name, "Cancel") }

        def click_sign_out_button
          wait { sign_out_button.displayed? }
          sign_out_button.click
          # assert_access_sign_out_popup
          # ok_button.click
        end

        def click_ok_to_access_contacts
          sleep 2
          assert_access_your_contacts_popup
          ok_button.click
          wait { find_element(:name, "INVITE FRIENDS").displayed? }
        end

        def click_ok_to_change_country
          assert_change_country_popup
          ok_button.click
        end

        def assert_access_sign_out_popup
          wait = Selenium::WebDriver::Wait.new :timeout => 3
          wait.until { driver.find_element(:name, "Sign Out").displayed? }
          cancel_button.displayed?
          ok_button.displayed?
        end

        def assert_access_your_contacts_popup
          wait = Selenium::WebDriver::Wait.new :timeout => 3
          wait.until { driver.find_element(:name, "“The NET SET” Would Like to Access Your Contacts").displayed? }
          ok_button.displayed?
        end

        def assert_change_country_popup
          wait = Selenium::WebDriver::Wait.new :timeout => 3
          wait.until { driver.find_element(:name, "Change Country").displayed? }
          cancel_button.displayed?
          ok_button.displayed?
        end

        def select_settings_options(setting_options)
          find_element(:name, "#{setting_options}").click
          sleep 1
        end

        def click_on_invite_friends_option
          invite_friends_button.click
        end

        def click_on_country_selection_option
          country_selection_button.click
        end

        def invite_friend_via_email_or_number(email_or_mobile)
          friends_name_field.click
          friends_name_field.type(email_or_mobile)
        end

        def click_on_invite_button
          invite_button.click
        end

        def search_and_select_country(country)
          filter_country_field.type(country)
          country_list.first.click
        end

        def search_for_country(country)
          filter_country_field.type(country)
        end
      end
    end
  end
end