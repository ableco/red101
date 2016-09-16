class Api::V1::TopicsController < Api::V1Controller
  def destroy
    if @topic.destroy
      head :ok
    else
      head :forbidden
    end
  end

  private

  def permitted_attributes
    %i(name)
  end
end
