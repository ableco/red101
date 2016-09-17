require 'test_helper'

class Api::V1::TopicsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:admin)
  end
end
