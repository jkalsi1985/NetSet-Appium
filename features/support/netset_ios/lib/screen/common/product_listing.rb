module NetsetiOS
  module Screen
    module Common
      class ProductListing < NetsetiOS::App

        attr_accessor :first_product, :next_product

        element(:first_brand_title)             { find_element(:name, "111SKIN") }
        element(:product_listing)               { find_elements(:class, "UIACollectionCell") }
        element(:product_love_button)           { find_elements(:name, "Product love button") }
        element(:product_image)                 { find_elements(:name, "Style image") }
        element(:product_price)                 { find_elements(:name, "Style product price") }
        element(:product_designer_name)         { find_elements(:name, "Product designer name") }
        element(:total_loves_on_each_product)   { find_elements(:name, "Product total loves")[1] }
        element(:total_comments_on_each_product){ find_elements(:name, "Product total comments") }
        element(:shop_full_collection_button)   { find_element(:name, "Shop Full Collection") }

        # Sort and filter button
        element(:sort_and_filter_button)        { find_element(:name, "FILTER & SORT") }

        def click_on_sort_and_filter_button
          sort_and_filter_button.click
        end

        def click_on_first_love_button
          product_love_button.first.click
        end

        def click_on_first_product_image
          product_image.first.click
          sleep 2
        end

        def click_on_first_product
          product_listing.first.click
        end

        def capture_first_price_label
          product_price.first.value
        end

        def sort_product_price
          arr = product_price
          arr.each do |i|
            if i[1]
              @first_product = i[0].value[1..-1].to_i
              @next_product = i[1].value[1..-1].to_i
            end
          end
        end

        def capture_all_designer_name(designer_name)
          halfproductname = product_designer_name.size / 2
          arr = product_designer_name.to_a.drop(halfproductname)
          arr.each {|e|e.value.include?(designer_name)}
        end

        def find_sold_out_products
          # halfsize = product_price.size / 2
          # arr = product_price.to_a.drop(halfsize)
          product_price.each { |row|
            a = row.value.include?("SOLD OUT")
            return a if a == true
          }
        end

        def capture_total_love_from_product
          total_loves_on_each_product.value.delete(" Loves").to_i
        end

        def capture_total_comment_from_product
          half_total_product_comments = total_comments_on_each_product.size / 2
          arr = total_comments_on_each_product.to_a.drop(half_total_product_comments)
          arr.first.value.delete(" Comments").to_i
        end

        def click_on_first_total_love_label
          total_loves_on_each_product.click
        end

        def click_on_first_total_comment_label
          half_total_product_comments = total_comments_on_each_product.size / 2
          arr = total_comments_on_each_product.to_a.drop(half_total_product_comments)
          arr.first.click
          sleep 1
        end

        def capture_first_product_price
          halfproductprice = product_price.size / 2
          arr = product_price.to_a.drop(halfproductprice)
          arr.first.value.delete("$").to_i
        end

        def view_fill_shop_collection_list
          execute_script "mobile: scrollTo", :element => find_elements(:class, "UIACollectionCell")[4].ref
          shop_full_collection_button.click
          sleep 2
        end
      end
    end
  end
end