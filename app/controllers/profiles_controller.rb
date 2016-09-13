class ProfilesController < ApplicationController
  skip_before_action :authorize, only: %i(new create)

  include Rest

  def new
    @user = User.new
  end

  private

  def find_resource
    current_user
  end

  def resource_class
    User
  end

  def permitted_attributes
    %i(
      first_name
      last_name
      email
      password
      phone
      level
      location
      school
      role
      since
      about
    )
  end

  def after_path
    profile_path
  end
end
