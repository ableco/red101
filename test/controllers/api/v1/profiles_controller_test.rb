require 'test_helper'

class Api::V1::ProfilesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @member = users(:member)
  end

  def test_create_with_good_data
    assert_difference 'ActionMailer::Base.deliveries.length', 1 do
      assert_difference 'User.count', 1 do
        post api_v1_profile_url, params: { user: good_user_params }
      end
    end

    assert_response :created

    response_json = JSON.parse(response.body)

    assert response_json['token'].present?
  end

  def test_create_with_bad_data
    assert_difference 'ActionMailer::Base.deliveries.length', 0 do
      assert_difference 'User.count', 0 do
        post api_v1_profile_url, params: { user: bad_user_params }
      end
    end

    assert_response :unprocessable_entity
  end

  def test_create_with_malformed_email
    assert_difference 'ActionMailer::Base.deliveries.length', 0 do
      assert_difference 'User.count', 0 do
        post api_v1_profile_url, params: { user: bad_email_user_params }
      end
    end

    assert_response :unprocessable_entity
  end

  def test_create_with_missing_password
    assert_difference 'ActionMailer::Base.deliveries.length', 0 do
      assert_difference 'User.count', 0 do
        post api_v1_profile_url, params: { user: missing_password_user_params }
      end
    end

    assert_response :unprocessable_entity
  end

  def test_show
    get api_v1_profile_url, headers: v1_authorization_header(@member)

    assert_response :success

    response_json = JSON.parse(response.body)

    assert_equal response_json['first_name'], @member.first_name
    assert_equal response_json['last_name'],  @member.last_name
    assert_equal response_json['email'],      @member.email
  end

  private

    def good_user_params
      number = SecureRandom.hex(8)

      {
        first_name: "First Name #{ number }",
        last_name:  "Last Name #{ number }",
        email:      "#{ number }@example.com",
        password:   number
      }
    end

    def bad_user_params
      good_user_params.except(:first_name, :last_name)
    end

    def bad_email_user_params
      good_user_params.tap { |h| h[:email] = 'no' }
    end

    def missing_password_user_params
      good_user_params.except(:password)
    end
end
