module Auth
  extend ActiveSupport::Concern

  included do
    before_action :authorize
    delegate      :current_user, to: :current_device
    delegate      :authorized?,  to: :authorization
    helper_method :token,
                  :current_user,
                  :authorized?
  end

  private

    def current_device
      @current_device ||= Device.active.find_by(token: token) || Device.new
    end

    def token
      raise NotImplementedError
    end

    def authorize
      head :unauthorized unless authorized?(controller_name, action_name, resource)
    end

    def authorization
      @authorization ||= Authorization.new(current_user)
    end

    def resource
      nil
    end
end
