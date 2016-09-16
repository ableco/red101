class Api::V1::TemplatesController < Api::V1Controller
  private

  def permitted_attributes
    %i(name question_limit).push(topic_ids: [])
  end
end
