module NetsetiOS
  module Screen
    module Common
      class SignIn < NetsetiOS::App

        element(:sign_in_title)                   { find_element(:name, "SIGN IN") }
        element(:email_address_field)             { find_element(:name, "Email address") }
        element(:password_field)                  { find_element(:name, "Password") }
        element(:license_agreement)               { find_element(:name, "License agreement") }
        element(:sign_in_button)                  { find_element(:name, "Sign in") }
        element(:forgotten_password_link)         { find_element(:name, "Forgotten password?") }
        element(:incorrect_login_details_message) { find_element(:name, "Your email address or password was incorrect") }

        def submit_sign_in_details(email_address,password)
          enter_email_address(email_address)
          enter_password(password)
          click_on_sign_in_button
          sleep 10
        end

        def enter_email_address(email_address)
          email_address_field.click
          email_address_field.type(email_address)
        end

        def enter_password(password)
          password_field.click
          password_field.type(password)
        end

        def click_on_sign_in_button
          sign_in_button.click
        end

        def click_on_forgotten_password_link
          forgotten_password_link.click
        end

        def end_user_license_agreement_link
          agreement_link = license_agreement.from_string(62)
          agreement_link.click
        end
      end
    end
  end
end