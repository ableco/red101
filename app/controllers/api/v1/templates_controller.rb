class Api::V1::TemplatesController < Api::V1Controller
  def create
    if @template.save
      render :show, status: :created
    else
      render json: { errors: @template.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def resource_params
    params.require(:template).permit(:name, topics_attributes: [:id])
  end
end
