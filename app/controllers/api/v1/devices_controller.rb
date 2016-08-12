class Api::V1::DevicesController < ApiController
  def create
    @device = Device.new(device_params)

    if @device.save
      render :show, status: 201
    else
      head :not_found
    end
  end

  private

  def device_params
    params.require(:device).permit(:email, :password)
  end
end
