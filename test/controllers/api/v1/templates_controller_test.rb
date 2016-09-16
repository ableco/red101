require 'test_helper'

class Api::V1::TemplatesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:admin)
  end

  # def test_creation_success
  #   assert_difference 'Template.count', 1 do
  #     post api_v1_templates_url, params: { template: good_template_params }, headers: v1_authorization_header(@admin)
  #   end
  #
  #   response_json = JSON.parse(response.body)
  #
  #   assert_response :created
  # end

  def test_creation_error
    assert_difference 'Template.count', 0 do
      post api_v1_templates_url, params: { template: bad_template_params }, headers: v1_authorization_header(@admin)
    end
  end

  private

  def good_template_params
    @topic_1 = topics(:creativity)
    @topic_2 = topics(:leadership)
    @topic_3 = topics(:culture)
    {
      name: 'any_name',
      topics_ids: [ @topic_1.id, @topic_2.id, @topic_3.id ]
    }
  end

  def bad_template_params
    {
      any_attribute: 'any_attribute'
    }
  end
end
