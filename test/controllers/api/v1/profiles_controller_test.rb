require 'test_helper'

class Api::V1::ProfilesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @member = users(:member)
  end

  def test_show
    get api_v1_profile_url, headers: v1_authorization_header(@member.devices.first.token)

    assert_response :success

    response_json = JSON.parse(response.body)

    assert_equal response_json['first_name'], @member.first_name
    assert_equal response_json['last_name'],  @member.last_name
    assert_equal response_json['email'],      @member.email
  end
end
