class Api::V1::TemplatesController < Api::V1Controller
  def create
    if @template.save
      render :show, status: :created
    else
      head :not_found
    end
  end

  private

  def new_resource_params
    template_params
  end

  def template_params
    params.require(:template).permit(:name, topics_attributes: [:id])
  end

end
