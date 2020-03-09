module NetsetiOS
  module Screen
    module Common
      class Register < NetsetiOS::App

        element(:register_title)            { find_element(:name, "REGISTER") }
        element(:register_message)          { find_element(:name, "Register message") }
        element(:email_field)               { find_element(:name, "Email address") }
        element(:first_name_field)          { find_element(:name, "First name") }
        element(:surname_field)             { find_element(:name, "Surname") }
        element(:password_field)            { find_element(:name, "Password") }
        element(:re_enter_password_field)   { find_element(:name, "Re-enter password") }
        element(:register_button)           { find_element(:name, "Register") }

        # Registration error messages
        element(:already_registered_message)   { find_element(:name, "This email address is already registered.") }
        element(:password_too_short_message)   { find_element(:name, "Password must be at least 6 characters") }
        element(:register_error)               { find_element(:name, "There was a problem with registration. Please check your details and try again.") }

        def fill_in_personal_details(email, first_name, surname)
          email_field.click
          email_field.type(email)
          first_name_field.click
          first_name_field.type(first_name)
          surname_field.click
          surname_field.type(surname)
        end

        def enter_email_address_register(email_address)
         email_field.click
         email_field.type(email_address)
        end

        def fill_in_password(password)
          password_field.click
          password_field.type(password)
          re_enter_password_field.click
          re_enter_password_field.type(password)
        end

        def fill_in_password_not_matching(password, re_enter_password)
          password_field.click
          password_field.type(password)
          re_enter_password_field.click
          re_enter_password_field.type(re_enter_password)
        end

        def click_on_register_button
          register_button.click
        end
      end
    end
  end
end