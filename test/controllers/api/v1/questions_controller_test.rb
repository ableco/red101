require 'test_helper'

class Api::V1::QuestionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:admin)
  end

  def test_creation_success
    assert_difference 'Question.count', 1 do
      post api_v1_questions_url, params: { question: good_question_params }, headers: v1_authorization_header(@admin)
    end

    response_json = JSON.parse(response.body)

    assert_response :created
  end

  def test_creation_error
    assert_difference 'Question.count', 1 do
      post api_v1_questions_url, params: { question: good_question_params }, headers: v1_authorization_header(@admin)
    end
  end

  private

  def good_question_params
    @topic = topics(:creativity)
    {
      content: 'any_content',
      options_attributes: [
        { content: 'any_question_content_1', correct: true },
        { content: 'any_question_content_2', correct: false },
        { content: 'any_question_content_2', correct: false }
      ],
      topic_id: @topic.id
    }
  end

  def bad_question_params
    {
      any_attribute: 'any_attribute'
    }
  end
end
