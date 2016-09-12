class DevicesController < ApplicationController
  skip_before_action :authorize, only: %i(new create)

  def new
  end

  def create
  end
end
