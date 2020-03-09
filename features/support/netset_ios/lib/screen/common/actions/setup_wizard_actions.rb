module NetsetiOS
  module Screen
    module Common
      module Actions

        def click_on_skip_link
          setup_wizard_screen.click_on_skip_button
        end

        def skip_all_the_screen_on_setup_wizard
          setup_wizard_screen.click_forward_button_from_welcome_screen
          wait { expect(setup_wizard_screen.step_one_title.displayed?).to be true }
          click_on_skip_link
          sleep 2
          wait { expect(setup_wizard_screen.step_two_title.displayed?).to be true }
          click_on_skip_link
          sleep 2
          wait { expect(setup_wizard_screen.step_three_title.displayed?).to be true }
          click_on_skip_link
           wait { expect(setup_wizard_screen.step_four_title.displayed?).to be true }
          click_on_skip_link
          sleep 2
          wait { expect(setup_wizard_screen.step_five_title.displayed?).to be true }
          click_on_skip_link
          sleep 2
          wait { expect(setup_wizard_screen.step_six_title.displayed?).to be true }
          click_on_skip_link
          sleep 1
          wait { expect(common_screen.tooltip_title.displayed?).to be true }
          common_screen.click_tooltip_view
          browse_feed_screen.click_on_filter_apply_button
          wait { expect(browse_feed_screen.menu_item_feed.displayed?).to be true }
        end

        def skip_all_screen_from_step_one
          setup_wizard_screen.click_on_forward_button_from_step_1_screen
          wait { expect(setup_wizard_screen.step_two_title.displayed?).to be true }
          click_on_skip_link
          wait { expect(setup_wizard_screen.step_three_title.displayed?).to be true }
          click_on_skip_link
          wait { expect(setup_wizard_screen.step_four_title.displayed?).to be true }
          click_on_skip_link
          wait { expect(setup_wizard_screen.step_five_title.displayed?).to be true }
          click_on_skip_link
          wait { expect(setup_wizard_screen.step_six_title.displayed?).to be true }
          click_on_skip_link
          wait { expect(common_screen.tooltip_title.displayed?).to be true }
          common_screen.click_tooltip_view
          browse_feed_screen.click_on_filter_apply_button
          wait { expect(browse_feed_screen.menu_item_feed.displayed?).to be true }
        end

        def skip_all_screen_from_step_two
          setup_wizard_screen.click_on_forward_button_from_step_two
          wait { expect(setup_wizard_screen.step_three_title.displayed?).to be true }
          click_on_skip_link
          wait { expect(setup_wizard_screen.step_four_title.displayed?).to be true }
          click_on_skip_link
          wait { expect(setup_wizard_screen.step_five_title.displayed?).to be true }
          click_on_skip_link
          wait { expect(setup_wizard_screen.step_six_title.displayed?).to be true }
          click_on_skip_link
          wait { expect(common_screen.tooltip_title.displayed?).to be true }
          common_screen.click_tooltip_view
          browse_feed_screen.click_on_filter_apply_button
          wait { expect(browse_feed_screen.menu_item_feed.displayed?).to be true }
        end

        def skip_all_screen_from_step_three
          expect(setup_wizard_screen.step_three_title.displayed?).to be true
          click_on_skip_link
          wait { expect(setup_wizard_screen.step_four_title.displayed?).to be true }
          click_on_skip_link
          wait { expect(setup_wizard_screen.step_five_title.displayed?).to be true }
          click_on_skip_link
          wait { expect(setup_wizard_screen.step_six_title.displayed?).to be true }
          click_on_skip_link
          wait { expect(common_screen.tooltip_title.displayed?).to be true }
          common_screen.click_tooltip_view
          browse_feed_screen.click_on_filter_apply_button
          wait { expect(browse_feed_screen.menu_item_feed.displayed?).to be true }
        end

        def skip_all_screen_from_step_four
          expect(setup_wizard_screen.step_four_title.displayed?).to be true
          click_on_skip_link
          wait { expect(setup_wizard_screen.step_five_title.displayed?).to be true }
          click_on_skip_link
          wait { expect(setup_wizard_screen.step_six_title.displayed?).to be true }
          click_on_skip_link
          wait { expect(common_screen.tooltip_title.displayed?).to be true }
          common_screen.click_tooltip_view
          browse_feed_screen.click_on_filter_apply_button
          wait { expect(browse_feed_screen.menu_item_feed.displayed?).to be true }
        end

        def skip_all_screen_from_step_five
          expect(setup_wizard_screen.step_five_title.displayed?).to be true
          click_on_skip_link
          wait { expect(setup_wizard_screen.step_six_title.displayed?).to be true }
          click_on_skip_link
          wait { expect(common_screen.tooltip_title.displayed?).to be true }
          common_screen.click_tooltip_view
          browse_feed_screen.click_on_filter_apply_button
          wait { expect(browse_feed_screen.menu_item_feed.displayed?).to be true }
        end

        def skip_a_screen_from_step_six
          expect(setup_wizard_screen.step_six_title.displayed?).to be true
          click_on_skip_link
          wait { expect(common_screen.tooltip_title.displayed?).to be true }
          common_screen.click_tooltip_view
          browse_feed_screen.click_on_filter_apply_button
          wait { expect(browse_feed_screen.menu_item_feed.displayed?).to be true }
        end

        def edit_profile_on_final_step(name, username, bio)
          setup_wizard_screen.enter_name_into_field(name)
          setup_wizard_screen.enter_username_into_field(username)
          setup_wizard_screen.enter_bio_into_field(bio)
        end

        def go_to_designer_step_in_setup_wizard
          setup_wizard_screen.click_forward_button_from_welcome_screen
          wait { expect(setup_wizard_screen.step_one_title.displayed?).to be true }
          setup_wizard_screen.click_on_skip_button
          wait { expect(setup_wizard_screen.step_two_title.displayed?).to be true }
        end

        def go_to_style_icon_step_in_setup_wizard
          setup_wizard_screen.click_forward_button_from_welcome_screen
          wait { expect(setup_wizard_screen.step_one_title.displayed?).to be true }
          setup_wizard_screen.click_on_skip_button
          wait { expect(setup_wizard_screen.step_two_title.displayed?).to be true }
          setup_wizard_screen.click_on_skip_button
          wait { expect(setup_wizard_screen.step_three_title.displayed?).to be true }
        end

        def go_to_style_tribe_step_in_setup_wizard
          setup_wizard_screen.click_forward_button_from_welcome_screen
          wait { expect(setup_wizard_screen.step_one_title.displayed?).to be true }
          setup_wizard_screen.click_on_skip_button
          wait { expect(setup_wizard_screen.step_two_title.displayed?).to be true }
          setup_wizard_screen.click_on_skip_button
          wait { expect(setup_wizard_screen.step_three_title.displayed?).to be true }
          setup_wizard_screen.click_on_skip_button
          wait { expect(setup_wizard_screen.step_four_title.displayed?).to be true }
        end

        def go_to_final_step_in_setup_wizard
          setup_wizard_screen.click_forward_button_from_welcome_screen
          wait { expect(setup_wizard_screen.step_one_title.displayed?).to be true }
          click_on_skip_link
          sleep 2
          expect(setup_wizard_screen.step_two_title.displayed?).to be true
          click_on_skip_link
          sleep 2
          expect(setup_wizard_screen.step_three_title.displayed?).to be true
          click_on_skip_link
          sleep 2
          expect(setup_wizard_screen.step_four_title.displayed?).to be true
          click_on_skip_link
          sleep 2
          expect(setup_wizard_screen.step_five_title.displayed?).to be true
          click_on_skip_link
          sleep 2
          expect(setup_wizard_screen.step_six_title.displayed?).to be true
        end

        def click_on_join_netset_button
          setup_wizard_screen.click_on_join_the_netset_button
          wait { expect(common_screen.tooltip_title.displayed?).to be true }
          common_screen.click_tooltip_view
          browse_feed_screen.click_on_filter_apply_button
          wait { expect(browse_feed_screen.menu_item_feed.displayed?).to be true }
        end
      end
    end
  end
end

World(NetsetiOS::Screen::Common::Actions)