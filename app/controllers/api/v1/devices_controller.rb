class Api::V1::DevicesController < ApiController
  skip_before_action :authorize, only: :create

  def create
    if resource.save
      render :show, status: 201
    else
      head :not_found
    end
  end

  def destroy
    if resource.destroy
      head :ok
    else
      render json: { errors: @device.errors.full_messages }
    end
  end

  private

  def device_params
    params.require(:device).permit(:email, :password)
  end

  def resource
    @device ||= params[:id].present? ? Device.find(params[:id]) : Device.new(device_params)
  end
end
