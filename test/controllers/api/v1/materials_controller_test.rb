require 'test_helper'

class Api::V1::MaterialsControllerTest < ActionDispatch::IntegrationTest
  def test_index
    get api_v1_materials_url

    response_json = JSON.parse(response.body)

    assert_response :success

    puts response_json.inspect
  end
end
