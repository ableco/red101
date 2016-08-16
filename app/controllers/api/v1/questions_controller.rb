class Api::V1::QuestionsController < Api::V1Controller
  def create
    if @question.save
      render :show, status: :created
    else
      render json: { errors: @question.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def resource_params
    params.require(:question).permit(:content, :topic_id, options_attributes: [:content, :correct])
  end
end
