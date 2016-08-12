class Api::V1::MaterialsController < ApiController
  skip_before_action :authorize, only: :index

  def index
    @materials = Material.search_by_query(params[:query]).page(params[:page])
  end
end
