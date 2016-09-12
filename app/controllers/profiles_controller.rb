class ProfilesController < ApplicationController
  include Rest

  private

  def resource_class
    User
  end

  def permitted_attributes
    %i(first_name last_name email password)
  end

  def after_path
    profile_path
  end
end
