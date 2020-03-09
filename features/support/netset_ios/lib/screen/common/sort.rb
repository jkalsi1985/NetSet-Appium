module NetsetiOS
  module Screen
    module Common
      class Sort < NetsetiOS::App

        element(:apply_button)              { find_element(:name, "Apply button") }
        element(:recommended_button)        { find_element(:name, "RECOMMENDED") }
        element(:low_to_high_price_button)  { find_element(:name, "LOW TO HIGH") }
        element(:high_to_low_price_button)  { find_element(:name, "HIGH TO LOW") }
        element(:popular_button)            { find_element(:name, "POPULAR") }
        element(:close_sort_bar)            { find_element(:name, "Close sort bar") }
        element(:red_bar)                   { find_element(:name, "Red bar") }
        element(:sort_by_button)            { find_element(:name, "SORT BY") }


        def click_on_recommended_button
          recommended_button.click
        end

        def sort_by_on_low_to_high_price
          low_to_high_price_button.click
        end

        def sort_by_on_high_to_low_price
          high_to_low_price_button.click
        end

        def sort_by_popular_button
          popular_button.click
        end

        def close_sort_bar
          close_sort_bar.click
        end

        def click_on_apply_button
          apply_button.click
        end

        def sort_by(sort_option)
          find_element(:name, "#{sort_option}").click
        end

        def click_on_sort_by_button
          sort_by_button.click
        end
      end
    end
  end
end