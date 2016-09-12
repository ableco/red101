class RootController < ApplicationController
  skip_before_action :authorize, only: :index

  def index
    flash.keep
    redirect_to next_path
  end

  private

  def next_path
    current_user ? profile_path : login_path
  end
end
