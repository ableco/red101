class RootController < ApplicationController
  skip_before_action :authorize, only: :index

  def index
    if current_user
      profile_path
    else
      login_path
    end
  end
end
