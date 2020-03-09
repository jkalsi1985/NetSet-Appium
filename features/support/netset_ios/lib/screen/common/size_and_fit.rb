module NetsetiOS
  module Screen
    module Common
      class SizeAndFit < NetsetiOS::App

        element(:size_and_fit_title)             { find_element(:name, "SIZE AND FIT") }
        element(:select_a_size_button)           { find_element(:name, "Add to bag button") }
        element(:original_price_label)           { find_element(:name, "Previous price label") }
        element(:list_of_product_list)           { find_elements(:name, "Product size") }

        def select_and_click_on_size(size)
          find_element(:name, "#{size}").click
          click_on_select_a_size_button
        end

        def click_on_select_a_size_button
          select_a_size_button.click
        end

        def select_first_product_size
          list_of_product_list.first.value
          list_of_product_list.first.click
        end

        def select_last_product_size
          list_of_product_list.last.value
          list_of_product_list.last.click
        end
      end
    end
  end
end