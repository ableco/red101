class Api::V1::ProfilesController < Api::V1Controller
  skip_before_action :authorize

  def show
  end

  def create
    if @user.save
      UserMailer.welcome(@user).deliver_now
      @device = @user.create_device
      render :show, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

    def find_resource
      current_user
    end

    def resource_class
      User
    end

    def resource_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
