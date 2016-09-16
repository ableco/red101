class Api::V1::ProfilesController < Api::V1Controller
  skip_before_action :authorize, only: :create

  private

  def find_resource
    current_user
  end

  def resource_class
    User
  end

  def permitted_attributes
    %i(first_name last_name email password)
  end

  def created
    UserMailer.welcome(@user).deliver_later
    @device = @user.create_device
  end
end
