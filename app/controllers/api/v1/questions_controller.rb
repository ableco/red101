class Api::V1::QuestionsController < Api::V1Controller
  private

  def permitted_attributes
    %i(content topic_id).push(options_attributes: %i(content correct))
  end
end
