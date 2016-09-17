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
    @current_device ||= Device.current(token, request.user_agent)
  end

  def token
    raise NotImplementedError
  end

  def authorize
    return true if authorized?(controller_name, action_name, resource)

    respond_to do |format|
      format.any(:js, :json) { head :authorized }
      format.html { redirect_to(root_path, alert: t(:unauthorized)) }
    end
  end

  def authorization
    @authorization ||= Authorization.new(current_user, self.class.parent_name)
  end

  def resource
    nil
  end
end
