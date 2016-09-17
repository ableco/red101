require 'test_helper'

class DiagnosticTest < ActiveSupport::TestCase
  def setup
    @member = users(:member)
  end

  def test_questions_limit
    template   = templates(:creativity_and_leadership)
    reference  = template.name
    diagnostic = @member.diagnostics
                        .create(user: @member, template: template, reference: reference)

    assert_equal 4, diagnostic.questions.count
  end
end
