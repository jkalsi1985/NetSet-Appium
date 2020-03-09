module NetsetiOS
  module Screen
    module Common
      class Loves < NetsetiOS::App

        element(:loves_title)                { find_element(:name, "LOVES") }
        element(:love_list)                  { find_elements(:class, "UIACollectionCell") }
        element(:ugc_love_total_button)      { find_elements(:name, "UGC total love button") }
        element(:ugc_content_image)          { find_elements(:name, "UGC content image") }
        element(:ugc_caption_message)        { find_elements(:name, "UGC caption") }
      end
    end
  end
end