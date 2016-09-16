class UsersController < ApplicationController
  include Rest
  include Admin

  def index
    @users = User.page(params[:page])
  end
end
