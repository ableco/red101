class Api::V1::DevicesController < Api::V1Controller
  skip_before_action :authorize, only: :create

  def create
    if @device.save
      render :show, status: 201
    else
      head :not_found
    end
  end

  def destroy
    current_device.sign_out!
    head :ok
  end

  private

  def resource_params
    params.require(:device).permit(:email, :password)
  end
end
