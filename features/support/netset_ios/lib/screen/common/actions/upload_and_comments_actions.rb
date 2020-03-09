module NetsetiOS
  module Screen
    module Common
      module Actions

        def upload_photo_from_camera_roll
          upload_screen.click_all_photo_text
          sleep 2
          upload_screen.select_and_click_first_camera_image
          wait { expect(upload_screen.move_and_scale_title.displayed?).to be true }
          upload_screen.click_on_move_and_scale_save_button
          sleep 3
          upload_screen.click_on_ugc_post_button
          sleep 5
        end

        def upload_photo_and_add_caption_message_from_camera_roll(message)
          navigation_tab_bar_screen.click_on_upload_button
          upload_screen.click_all_photo_text
          sleep 2
          upload_screen.select_and_click_first_camera_image
          wait { expect(upload_screen.move_and_scale_title.displayed?).to be true }
          upload_screen.click_on_move_and_scale_save_button
          sleep 3
          wait { expect(upload_screen.write_your_caption_message.displayed?).to be true }
          wait { expect(upload_screen.add_style_tribes_message.displayed?).to be true }
          upload_screen.enter_your_caption_message(message)
          upload_screen.click_on_ugc_post_button
          sleep 5
          wait { expect(browse_feed_screen.menu_item_feed.displayed?).to be true }
        end

        def go_to_comment_screen_and_add_comment(comments)
          browse_feed_screen.click_on_first_comment_on_this_button
          wait { expect(comments_screen.comments_title.displayed?).to be true }
          comments_screen.enter_and_post_comment(comments)
        end

        def assert_first_comment_is_displayed
          browse_feed_comment = browse_feed_screen.capture_first_content_comment
          source = browse_feed_screen.user_profile_name+":"+" "+comments_screen.first_comment
          expect(browse_feed_comment).to eql(source)
        end

        def add_style_tribe_after_uploading_ugc_photo
          navigation_tab_bar_screen.click_on_upload_button
          upload_screen.click_all_photo_text
          sleep 2
          upload_screen.select_and_click_first_camera_image
          wait { expect(upload_screen.move_and_scale_title.displayed?).to be true }
          upload_screen.click_on_move_and_scale_save_button
          sleep 3
          close_tooltip_popup
          wait { expect(upload_screen.write_your_caption_message.displayed?).to be true }
          upload_screen.add_style_tribe
          upload_screen.click_on_ugc_post_button
          sleep 5
          wait { expect(common_screen.tooltip_view.displayed?).to be true }
          common_screen.click_tooltip_view
          wait { expect(browse_feed_screen.menu_item_feed.displayed?).to be true }
        end

        def delete_first_comment
          browse_feed_screen.click_on_first_comment_on_this_button
          comments_screen.delete_first_comment
          common_screen.go_back_to_previous_screen
        end
      end
    end
  end
end

World(NetsetiOS::Screen::Common::Actions)