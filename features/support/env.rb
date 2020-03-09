require 'rspec/expectations'
require 'appium_lib'
require 'cucumber/ast'
require 'pry'
require 'require_all'

require './features/support/netset_ios/lib/app'
require './features/support/netset_ios/lib/base'
require './features/support/netset_ios/lib/modules/utilityobjects'
require './features/support/netset_ios/lib/utils/utilities'
require './features/support/netset_ios/lib/utils/api_methods'

# requiring the configuration class which lets us use config.yml 
require File.dirname(__FILE__) + '/netset_ios/lib/helpers/configuration'
require_all File.expand_path('netset_ios/lib/modules', File.dirname(__FILE__))
require_all File.expand_path('netset_ios/lib/utils', File.dirname(__FILE__))

World { NetsetiOS::Base.new }
World(UtilityObjects)
World(Utilities)
World(APIMethods)
World(NetsetiOS)

