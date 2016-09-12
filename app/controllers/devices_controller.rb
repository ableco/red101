class DevicesController < ApplicationController
  skip_before_action :authorize

  include Rest

  def new
    @device = Device.new
  end

  def logout
    current_device.sign_out!
    redirect_to login_path
  end

  private

  def find_resource
    current_device
  end

  def permitted_attributes
    %i(email password)
  end

  def after_path
    current_user ? profile_path : login_path
  end

  def created
    cookies.signed[:token] = @device.token
  end
end
