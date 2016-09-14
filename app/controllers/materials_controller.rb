class MaterialsController < ApplicationController
  include Rest

  skip_before_action :authorize, only: :visit

  def index
    @materials = materials_scope.page(params[:page])
  end

  def visit
    create_visit
    redirect_to @material.url
  end

  private

  def materials_scope
    if query.present?
      Material.search(query)
    else
      Material.order(name: :asc)
    end
  end

  def permitted_attributes
    %i(title url details)
  end

  def query
    @query ||= params[:query]
  end

  def create_visit
    Visit.create(material: resource, user: current_user, referrer: request.referrer)
  end
end
