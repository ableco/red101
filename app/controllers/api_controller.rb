class ApiController < ActionController::API
  def current_user
    current_device.user
  end

  private

  def current_device
    @current_device ||= authenticate_with_http_token do |token, _|
                          Device.active.find_by(token: token) || Device.new
                        end
  end
end
