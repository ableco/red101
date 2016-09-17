require 'test_helper'

class Api::V1::MaterialsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @member = users(:member)
  end

  def test_index_without_query
    get api_v1_materials_url, headers: v1_authorization_header(@member)

    response_json = JSON.parse(response.body)

    assert_response :success
    assert_equal Material.count, response_json.length
  end

  def test_index_with_query
    get api_v1_materials_url(query: 'culture'), headers: v1_authorization_header(@member)

    response_json = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, response_json.length
  end
end
