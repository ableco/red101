class DevicesController < ApplicationController
  skip_before_action :authorize, only: %i(new create)

  include Rest

  def new
    @device = Device.new
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
