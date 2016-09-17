require 'test_helper'

class Api::V1::TemplatesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:admin)
  end
end
