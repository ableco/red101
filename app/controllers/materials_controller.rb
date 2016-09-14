class MaterialsController < ApplicationController
  include Rest

  def index
    @materials = Material.search(query).page(params[:page])
  end

  private

  def permitted_attributes
    %i(title url details)
  end

  def query
    @query ||= params[:query]
  end
end
