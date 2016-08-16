require 'test_helper'

class Api::V1::DiagnosticsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @member   = users(:member)
    @template = templates(:creativity_and_leadership)
  end

  def test_create_with_good_data
    assert_difference 'Diagnostic.count', 1 do
      post api_v1_diagnostics_url, headers: v1_authorization_header(@member),
                                    params: {
                                      diagnostic: good_diagnostic_params
                                    }
    end

    assert_response :created

    response_json = JSON.parse(response.body)

    assert_equal 4, response_json['questions'].length
  end

  def test_create_with_bad_data
    assert_difference 'Diagnostic.count', 0 do
      post api_v1_diagnostics_url, headers: v1_authorization_header(@member),
                                    params: {
                                      diagnostic: bad_diagnostic_params
                                    }
    end

    assert_response :unprocessable_entity
  end

  private

    def good_diagnostic_params
      {
        template_id: @template.id
      }
    end

    def bad_diagnostic_params
      {
        template_id: 'No'
      }
    end
end
