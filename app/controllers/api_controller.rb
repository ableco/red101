class ApiController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authorize
  helper_method :current_user,
                :authorization

  private

    def current_user
      current_device&.user
    end

    def current_device
      @current_device ||= authenticate_with_http_token do |token, _|
                            Device.active.find_by(token: token) || Device.new
                          end
    end

    def authorize
      head :unauthorized unless authorization.allow?(controller_name, action_name, resource)
    end

    def authorization
      @authorization ||= Authorization.new(current_user)
    end

    def resource
      nil
    end
end
