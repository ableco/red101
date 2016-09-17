require 'test_helper'

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @member = users(:member)
  end

  def test_create_with_good_data
    assert_difference 'User.count', 1 do
      post api_v1_users_url, params: { user: good_user_params }
    end

    assert_response :created

    response_json = JSON.parse(response.body)

    assert response_json['token'].present?
  end

  def test_create_with_bad_data
    assert_difference 'User.count', 0 do
      post api_v1_users_url, params: { user: bad_user_params }
    end

    assert_response :unprocessable_entity
  end

  def test_create_with_malformed_email
    assert_difference 'User.count', 0 do
      post api_v1_users_url, params: { user: bad_email_user_params }
    end

    assert_response :unprocessable_entity
  end

  def test_create_with_missing_password
    assert_difference 'User.count', 0 do
      post api_v1_users_url, params: { user: missing_password_user_params }
    end

    assert_response :unprocessable_entity
  end

  def test_show
    get api_v1_user_url(@member), headers: v1_authorization_header(@member)

    assert_response :success

    response_json = JSON.parse(response.body)

    assert_equal response_json['name'],  @member.name
    assert_equal response_json['email'], @member.email
  end

  private

  def good_user_params
    number = SecureRandom.hex(8)

    {
      name:     "User #{number}",
      email:    "#{number}@example.com",
      password: number
    }
  end

  def bad_user_params
    good_user_params.except(:name)
  end

  def bad_email_user_params
    good_user_params.tap { |h| h[:email] = 'no' }
  end

  def missing_password_user_params
    good_user_params.except(:password)
  end
end
