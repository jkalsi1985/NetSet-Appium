require 'yaml'

module UtilityObjects
  def test_data
    @test_data ||= YAML.load_file("features/support/config/test_data.yml")
  end
end