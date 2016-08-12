class ApiController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  attr_accessor :resource
  before_action :authorize

  def current_user
    current_device.user
  end

  private

  def current_device
    @current_device ||= authenticate_with_http_token do |token, _|
                          Device.active.find_by(token: token) || Device.new
                        end
  end

  def authorize
    head :unauthorized unless authorization.authorize?(controller_name, controller_action, resource)
  end

  def authorization
    @authorization ||= Authorization.new(current_user)
  end
end
