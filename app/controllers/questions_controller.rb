class QuestionsController < ApplicationController
  include Rest
  include Admin

  def index
    @questions = Question.page(params[:page])
  end

  def new
    @question.options.new
  end

  private

  def permitted_attributes
    %i(content topic_id).push(options_attributes: %i(id content correct _destroy))
  end
end
