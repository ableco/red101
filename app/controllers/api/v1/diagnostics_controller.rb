class Api::V1::DiagnosticsController < Api::V1Controller
  def create
    if @diagnostic.save
      render :show, status: :created
    else
      render json: { errors: @diagnostic.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def resource_params
    params.require(:diagnostic).permit(:template_id).merge(user_id: current_user.id)
  end
end
