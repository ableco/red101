class Api::V1::ProfilesController < Api::V1Controller
  def show
  end

  private
    def find_resource
      current_user
    end

    def resource_class
      User
    end
end
