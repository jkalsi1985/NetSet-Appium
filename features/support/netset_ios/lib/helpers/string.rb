module CamelCase
  def camel_case
    return self if self !~ /_/ && self =~ /[A-Z]+.*/
    split('_').map{|e| e.capitalize}.join
  end
end

module NETSETSanitize
  def sanitize
    self.gsub(' ', '_').gsub(/[^\w]/, "").downcase
  end

  def as_screen
    self.sanitize + "_screen"
  end
end

class String
  include NETSETSanitize
  include CamelCase
end

class Symbol
  include CamelCase
end