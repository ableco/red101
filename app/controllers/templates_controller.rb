class TemplatesController < ApplicationController
  include Rest
  include Admin

  def index
    @templates = Template.page(params[:page])
  end

  private

  def permitted_attributes
    %i(name question_limit).push(topic_ids: [])
  end
end
