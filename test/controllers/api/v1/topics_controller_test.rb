require 'test_helper'

class Api::V1::TopicsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:admin)
  end

  def test_creation_success
    assert_difference 'Topic.count', 1 do
      post api_v1_topics_url, params: { topic: good_topic_params }, headers: v1_authorization_header(@admin)
    end

    response_json = JSON.parse(response.body)

    assert_response :created
  end

  def test_creation_error
    assert_difference 'Topic.count', 0 do
      post api_v1_topics_url, params: { topic: bad_topic_params }, headers: v1_authorization_header(@admin)
    end
  end

  def test_deletion_success
    @topic_for_delete = topics(:creativity)
    assert_difference 'Topic.count', -1 do
      delete api_v1_topic_url(@topic_for_delete), headers: v1_authorization_header(@admin)
    end

    assert_response :ok
  end

  private

  def good_topic_params
    {
      name: 'any_name'
    }
  end

  def bad_topic_params
    {
      any_attribute: 'any_attribute'
    }
  end
end
