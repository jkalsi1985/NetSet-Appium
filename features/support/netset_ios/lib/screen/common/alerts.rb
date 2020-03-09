module NetsetiOS
  module Screen
    module Common
      class Alerts < NetsetiOS::App

        element(:alerts_title)              { find_element(:name, "ALERTS") }
        element(:list_of_alerts_message)    { find_elements(:class, "UIATableCell") }
        element(:list_of_alerts)            { find_elements(:class, "UIACollectionCell") }
        element(:user_profile_image)        { find_element(:name, "User profile image") }
        element(:alert_message)             { find_elements(:name, "Alert message") }
        element(:when_alert_received)       { find_elements(:name, "When user receieved alert") }
        element(:alert_status_icon)         { find_element(:name, "Alert status icon") }
        element(:no_alerts)                 { find_element(:name, "No alerts") }
        element(:alert_forward_button)      { find_element(:name, "Alert forward button") }

        # Sorry pop up
        element(:ok_button)                 { find_element(:name, "Ok") }
        element(:review_button)             { find_element(:name, "Review") }

        def click_on_first_alert
          list_of_alerts.first.click
          sleep 2
        end

        def capture_alert_message
          half_alerts_message = alert_message.size / 2
          arr = alert_message.to_a.drop(half_alerts_message)
          arr.first.value
        end

        def assert_comment_alert(alert_message)
          list_of_alerts_message.each { |row|
            a = row.value.include?(alert_message)
            return a if a == true
          }
        end

        def assert_sorry_deleted_photo_popup
          wait = Selenium::WebDriver::Wait.new :timeout => 3
          wait.until { driver.find_element(:name, "Sorry").displayed? }
          driver.find_element(:name, "Please review our End User License Agreement").displayed?
          ok_button.displayed?
          review_button.displayed?
        end

        def assert_sorry_comment_deleted_popup
          wait = Selenium::WebDriver::Wait.new :timeout => 3
          wait.until { driver.find_element(:name, "Sorry").displayed? }
          driver.find_element(:name, "The comment has been deleted").displayed?
          ok_button.displayed?
        end

        def click_ok_option_from_sorry_photo_deleted_popup
          click_on_first_alert
          # assert_sorry_deleted_photo_popup
          # ok_button.click
        end

        def click_ok_option_on_deleted_comment_popup
          click_on_first_alert
          # assert_sorry_comment_deleted_popup
          # ok_button.click
        end
      end
    end
  end
end