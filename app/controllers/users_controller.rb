class UsersController < ApplicationController
  include Rest

  def index
    @users = User.page(params[:page])
  end
end
