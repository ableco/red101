class QuestionsController < ApplicationController
  include Rest

  private

  def permitted_attributes
    %i(content topic_id).push(options_attributes: %i(content correct))
  end
end
