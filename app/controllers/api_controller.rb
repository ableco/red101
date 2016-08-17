class ApiController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  include Auth

  private

  def token
    authenticate_with_http_token { |t, _| t }
  end
end
