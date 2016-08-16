class Api::V1::TopicsController < Api::V1Controller
  def create
    if @topic.save
      render :show, status: :created
    else
      render json: { errors: @topic.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @topic.destroy
      head :ok
    else
      head :forbidden
    end
  end

  private

  def resource_params
    params.require(:topic).permit(:name)
  end
end
