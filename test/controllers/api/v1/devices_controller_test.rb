require 'test_helper'

class Api::V1::DevicesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @member = users(:member)
  end

  def test_authentication_success
    assert_difference 'Device.count', 1 do
      post api_v1_device_url, params: { device: good_device_params }
    end

    response_json = JSON.parse(response.body)

    assert_response :created
    assert response_json['token'].present?
  end

  def test_authentication_failure
    assert_difference 'Device.count', 0 do
      post api_v1_device_url, params: { device: bad_device_params }
    end

    assert_response :unprocessable_entity
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
