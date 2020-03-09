module NetsetiOS
  module Screen
    module Common
      module Actions

        def go_to_sign_in_screen
          onboarding_and_welcome_screen.click_on_i_will_this_later_app_button
          onboarding_and_welcome_screen.click_on_i_will_this_later_app_button
          onboarding_and_welcome_screen.click_to_skip_onboarding_screen
          onboarding_and_welcome_screen.click_on_sign_in_button
          expect(sign_in_screen.sign_in_title.displayed?).to be true
        end

        def go_to_register_screen
          onboarding_and_welcome_screen.click_on_i_will_this_later_app_button
          onboarding_and_welcome_screen.click_on_i_will_this_later_app_button
          onboarding_and_welcome_screen.click_to_skip_onboarding_screen
          onboarding_and_welcome_screen.click_on_register_button
          expect(register_screen.register_title.displayed?).to be true
        end

        def close_notification_and_submit_login_details(email_address, password)
          go_to_sign_in_screen
          sign_in_screen.submit_sign_in_details(email_address, password)
          # wait { expect(common_screen.tooltip_view.displayed?).to be true }
          # common_screen.click_tooltip_view
          # browse_feed_screen.click_on_filter_apply_button
        end

        def submit_login_details_without_closing_popup(email_address, password)
          onboarding_and_welcome_screen.click_on_sign_in_button
          sign_in_screen.submit_sign_in_details(email_address, password)
          begin
            common_screen.tooltip_title.displayed?
            close_tooltip_popup
          rescue Exception => e
            wait { expect(browse_feed_screen.menu_item_feed.displayed?).to be true }
            puts e.message
          ensure
            wait { expect(browse_feed_screen.menu_item_feed.displayed?).to be true }
          end
        end

        def enter_and_submit_login_details(email_address, password)
          onboarding_and_welcome_screen.click_on_sign_in_button
          expect(sign_in_screen.sign_in_title.displayed?).to be true
          sign_in_screen.submit_sign_in_details(email_address, password)
          sleep 5
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

        def enter_personal_details(email_address = @email_address)
          email_address ||= generate_random_email_address
          first_name = generate_random_first_name
          surname = generate_random_surname_name
          register_screen.fill_in_personal_details(email_address, first_name, surname)
          return email_address, first_name, surname
        end

        def enter_password(value)
          register_screen.fill_in_password(value)
        end

        def register_as_new_user
          go_to_register_screen
          @email_address, @first_name, @surname = enter_personal_details
          enter_password(test_data['passwords']['valid_password'])
          register_screen.click_on_register_button
          sleep 3
        end

        def register_and_go_to_feed_screen
          register_as_new_user
          sleep 15
          # common_screen.click_tooltip_view
          # sleep 2
          # browse_feed_screen.click_on_filter_apply_button
        end

        def sign_out_from_the_account
          go_to_profile_screen
          wait { expect(profile_screen.setting_button.displayed?).to be true }
          profile_screen.click_on_settings_button
          settings_screen.click_sign_out_button
          wait { expect(onboarding_and_welcome_screen.netset_intro_message.displayed?).to be true }
        end
      end
    end
  end
end

World(NetsetiOS::Screen::Common::Actions)