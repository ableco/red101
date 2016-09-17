class DevicesController < ApplicationController
  include Rest

  skip_before_action :authorize

  def new
    if current_user
      redirect_to after_path
    else
      @device = Device.new
    end
  end

  private

  def find_resource
    current_device
  end

  def permitted_attributes
    %i(email password)
  end

  def after_path
    configure_path
  end

  def created
    login(@device)
  end

  def deleted
    logout
  end
end
