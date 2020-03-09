module NetsetiOS
  module Screen
    module Common
      module Actions

        def go_to_product_shop_this_screen_from_brand_profile(brand_name)
          go_to_explore_and_close_tooltip
          explore_screen.choose_any_find_option("DESIGNER A-Z")
          designer_screen.search_and_select_designer(brand_name)
          sleep 3
          # brand_screen.click_on_shop_button
          # wait { expect(product_listing_screen.sort_button.displayed?).to be true }
          product_listing_screen.click_on_first_product_image
          sleep 2
        end

        def search_for_brand_go_to_any_product_options(brand_name, product_listing_option)
          go_to_explore_and_close_tooltip
          explore_screen.choose_any_find_option("DESIGNER A-Z")
          sleep 2
          designer_screen.choose_brand_from_list(brand_name)
          product_listing_screen.click_on_first_product_image
          wait { expect(product_landing_screen.product_image.displayed?).to be true }
          product_landing_screen.select_product_link_cell(product_listing_option)
          sleep 2
        end

        def search_and_select_designer(designer)
          go_to_explore_and_close_tooltip
          explore_screen.choose_any_find_option("DESIGNER A-Z")
          wait { expect(designer_screen.designer_title.displayed?).to be true }
          designer_screen.search_and_select_designer(designer)
        end

        def search_and_select_style_council
          go_to_explore_and_close_tooltip
          explore_screen.choose_any_find_option("STYLE COUNCIL")
          sleep 2
        end
      end
    end
  end
end

World(NetsetiOS::Screen::Common::Actions)