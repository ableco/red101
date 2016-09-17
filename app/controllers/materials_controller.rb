class MaterialsController < ApplicationController
  include Rest
  include Admin

  def index
    @materials = Material.search(query).page(params[:page])
  end

  private

  def permitted_attributes
    %i(topic_id title url description)
  end

  def query
    @query ||= params[:query]
  end
end
