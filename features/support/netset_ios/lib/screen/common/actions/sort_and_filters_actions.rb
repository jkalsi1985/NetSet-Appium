module NetsetiOS
  module Screen
    module Common
      module Actions

        def sort_the_product_list(sort_options)
          product_listing_screen.click_on_sort_button
          wait { expect(sort_screen.recommended_button.displayed?).to be true }
          sort_screen.sort_by(sort_options)
          sort_screen.click_on_apply_button
          wait { expect(product_listing_screen.sort_button.displayed?).to be true }
        end

        def filter_the_product_list(first_category,second_category,third_category)
          product_listing_screen.click_on_sort_and_filter_button
          filters_screen.select_first_category(first_category)
          filters_screen.select_second_category(second_category)
          filters_screen.select_third_category(third_category)
          filters_screen.click_on_apply_button
          sleep 2
        end

        def filter_by_designer(designer)
          product_listing_screen.click_on_sort_and_filter_button
          filters_screen.select_first_category("DESIGNERS")
          wait { expect(filters_screen.designer_title.displayed?).to be true }
          filters_screen.select_a_designer(designer)
          filters_screen.click_on_apply_button
        end

        def select_one_option_from_feed_filter(option)
          browse_feed_screen.tap_on_feed_filter
          sleep 0.5
          browse_feed_screen.select_from_everyone_option_list(option)
        end

        def select_two_options_from_feed_filter(option1, option2)
          browse_feed_screen.tap_on_feed_filter
          sleep 0.5
          browse_feed_screen.select_from_everyone_option_list(option1)
          browse_feed_screen.select_from_everything_option_list(option2)
          browse_feed_screen.click_on_filter_apply_button
          sleep 0.5
        end
      end
    end
  end
end

World(NetsetiOS::Screen::Common::Actions)