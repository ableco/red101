class Api::V1Controller < ApiController
  private

    def authorization
      @authorization ||= Authorization.new(current_user, 1)
    end
end
