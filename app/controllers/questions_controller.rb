class QuestionsController < ApplicationController
  include Rest
  include RequireTopics

  def index
    @query     = params[:query]
    @questions = Question.includes(:topic).search(@query).page(params[:page])
  end

  def new
    @question.options.new
  end

  private

  def permitted_attributes
    %i(content topic_id).push(options_attributes: %i(id content correct explanation _destroy))
  end
end
