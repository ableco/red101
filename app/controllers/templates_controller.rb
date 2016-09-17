class TemplatesController < ApplicationController
  include Rest
  include RequireTopics

  def index
    @templates = Template.order(name: :asc).page(params[:page])
  end

  private

  def permitted_attributes
    %i(name question_limit description).push(topic_ids: [])
  end
end
