class Api::V1::QuestionsController < Api::V1Controller
  def create
    if @question.save
      render :show, status: :created
    else
      head :not_found
    end
  end

  private

  def new_resource_params
    question_params
  end

  def question_params
    params.require(:question).permit(:content, :topic_id, options_attributes: [:content, :correct])
  end

end
