module NetsetiOS
  class Base < NetsetiOS::App
    attr_reader :type
    attr_reader :language

    def class_with_name name
      clazz = nil

      # Attempt to get the device specific version of the class
      clazz = NetsetiOS::Screen.const_get(@type).const_get(name) if NetsetiOS::Screen.const_get(@type).const_defined?(name)

      # If that doesn't work, just get the common one
      clazz = NetsetiOS::Screen::Common.const_get(name) if clazz.nil?

      # Return a configured instance
      instance = clazz.new
      instance.world = self
      instance
    end

    def initialize
      @type ||= ENV['TYPE'].gsub(/[^a-zA-Z]/, '').capitalize

      # Specify LOCALE on the command line to specify both, override LANGUAGE to set the language.
      # Default is en-GB for both.
      @locale ||= ENV["LOCALE"] || "en-GB"
      @language ||= ENV["LANGUAGE"] || @locale
    end

    # If the method ends in _screen, then make a property for that class and return it.
    # Otherwise, return super
    def method_missing(method_sym, *arguments, &block)

      if method_sym.to_s =~ /^(.*)_screen$/
        class_name = $1.camel_case
        variable_name = "@#{class_name}".to_sym

        # If we haven't asked for this screen before, create it.
        # Otherwise return the existing instance
        if self.instance_variable_defined? variable_name
          instance = self.instance_variable_get variable_name
        else
          start_app_if_needed
          instance = class_with_name class_name
          self.instance_variable_set variable_name, instance
        end

        # Always return the instance we just created/accessed
        instance

      else
        super
      end

    end

    # If the method ends in _screen then we can probably deal with it dynamically
    # Othwise, call super
    def respond_to?(method_sym, include_private = false)
      if method_sym.to_s =~ /^.*_screen$/
        true
      else
        super
      end
    end

    def capabilities
      {
          :"appium-version"=> '1.3.1',
          :address => '127.0.0.1',
          :port => '4723',
          :platformName => 'iOS',
          :deviceName => ENV['DN'],
          :platformVersion => ENV['PV'],
          :app => ENV['APP'],
          # :locationServicesAuthorized => true,
          :bundleId => 'com.net-a-porter.thenetbook',
          :language => @language,
          :locale => @locale,
          :waitForAppScript => '$.delay(5000); true;',
          :udid => ENV['udid'],
          :autoAcceptAlerts => true
      }
    end

    def start_app_if_needed
      if @driver.nil?
        @driver = Appium::Driver.new(caps: self.capabilities).start_driver
        Appium.promote_appium_methods Object
      end
    end

    # Only kill app - if run tests on simulator
    def stop_app
      if @driver
        driver_quit
        @driver = nil
      end
    end

    # Only sign out the pap - if run tests on real devices
    # def stop_app
    #   sign_in_displayed = true
    #   begin
    #     sign_in_screen.check_button
    #   rescue Exception => e
    #     sign_in_displayed = false
    #   end
    #
    #   profile_button_displayed = true
    #   begin
    #     navigation_tab_bar_screen.profile_button
    #   rescue Exception => e
    #     profile_button_displayed = false
    #   end
    #
    #   if profile_button_displayed && !sign_in_displayed
    #     sign_out_from_the_account
    #   end
    #   if @driver
    #     driver_quit
    #     @driver = nil
    #   end
    # end

    ## These methods will be replaced by Appium but until then we need to implement them
    # with a stub to load the app
    def driver
      start_app_if_needed
      @driver
    end

    def wait
      start_app_if_needed
      yield
    end
  end
end
