module NetsetiOS
	class App

		#include Sections

		attr_accessor :world

		def self.element(name, &block)
			define_method(name.to_s, &block)
		end

    #def self.section(identity, classname)
    #  class_eval %Q{
    #   def #{identity}
    #     @_#{identity} ||= #{classname.new})
    #   end
    # }
    #end

    #def self.section(identity, classname)
    #  class_eval %Q{
    #  def #{identity}
    #  @_#{identity} || #{classname.new})
    # }
    #end

    def self.section(classname)
      variable_name = "@#{classname}".to_sym
      instance = classname.new
      instance.world = self
      self.instance_variable_set variable_name, instance
      instance
    end


    def button_with_name name
			# Sigh, deal escaping with quotes
			name.gsub!('"') { '\"' }
			find_element :xpath, '//UIAButton[@name="' + name + '"]'
		end

		class << self
			alias :value    		:element
			alias :action   		:element
			alias :elements   	:element
		end
	end
end
