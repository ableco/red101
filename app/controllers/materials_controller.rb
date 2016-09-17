class MaterialsController < ApplicationController
  include Rest
  include RequireTopics

  def index
    @query     = params[:query]
    @materials = Material.search(@query).page(params[:page])
  end

  private

  def permitted_attributes
    %i(topic_id title url description)
  end
end
