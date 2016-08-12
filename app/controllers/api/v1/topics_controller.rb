class Api::V1::TopicsController < ApiController
  skip_before_action :authorize

  def create
    if @topic.save
      render :show, status: :created
    else
      head :not_found
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

  def new_resource_params
    topic_params
  end

  def topic_params
    params.require(:topic).permit(:name)
  end

end
