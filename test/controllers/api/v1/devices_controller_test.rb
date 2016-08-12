require 'test_helper'

class Api::V1::DevicesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @member = users(:member)
  end

  def test_authentication_success
    post api_v1_devices_url, params: { device: good_device_params }

    response_json = JSON.parse(response.body)

    assert_response :created
    assert response_json['token'].present?
  end

  def test_authentication_failure
    post api_v1_devices_url, params: { device: bad_device_params }
    assert_response :not_found
  end

  private

    def good_device_params
      {
        email:    @member.email,
        password: PASSWORD
      }
    end

    def bad_device_params
      good_device_params.tap { |h| h[:password] = 'NO' }
    end
end
