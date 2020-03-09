module NetsetiOS
  module Screen
    module Common
      module Actions
        def edit_profile_details(profile_name, profile_username, profile_bio)
          edit_profile_screen.edit_name_on_profile(profile_name)
          edit_profile_screen.edit_username_on_profile(profile_username)
          edit_profile_screen.edit_bio_on_profile(profile_bio)
        end

        def edit_profile_image
          edit_profile_screen.click_to_edit_profile_image
          upload_screen.click_all_photo_text
          sleep 2
          upload_screen.select_and_click_first_camera_image
          wait { expect(upload_screen.move_and_scale_title.displayed?).to be true }
          upload_screen.click_on_move_and_scale_save_button
          wait { expect(edit_profile_screen.edit_profile_title.displayed?).to be true }
        end

        def change_background_image
          edit_profile_screen.click_to_edit_background_image
          upload_screen.click_all_photo_text
          sleep 2
          upload_screen.select_and_click_first_camera_image
          wait { expect(upload_screen.move_and_scale_title.displayed?).to be true }
          upload_screen.click_on_move_and_scale_save_button
          wait { expect(edit_profile_screen.edit_profile_title.displayed?).to be true }
        end

        def go_to_admiring_list
          profile_screen.click_on_admiring_button
          wait { expect(profile_screen.admiring_title.displayed?).to be true }
        end
      end
    end
  end
end

World(NetsetiOS::Screen::Common::Actions)