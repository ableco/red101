class Api::V1::TemplatesController < Api::V1Controller
  private

  def permitted_attributes
    %i(name).push(topics_attributes: %i(id))
  end
end
