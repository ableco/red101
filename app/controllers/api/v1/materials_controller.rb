class Api::V1::MaterialsController < ApiController
  skip_before_action :authorize, only: :index

  def index
    @materials = materials_scope.page(params[:page])
  end

  private

    def materials_scope
      if params[:query].present?
        Material.search_by_query(params[:query])
      else
        Material.order(:created_at)
      end
    end
end
