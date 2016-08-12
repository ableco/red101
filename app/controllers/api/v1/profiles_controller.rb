class Api::V1::ProfilesController < ApiController
  def show
  end

  private

    def resource_class
      User
    end
end
