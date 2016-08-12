class ApiController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :resource,
                :authorize

  def current_user
    current_device&.user
  end

  private

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
      instance_variable_get("@#{ ivar_name }") ||
      instance_variable_set("@#{ ivar_name }", (find_resource || build_resource))
    end

    def ivar_name
      controller_name.singularize
    end

    def param_key
      resource_class.model_name.param_key
    end

    def find_resource
      resource_class.find(params[:id]) if params[:id].present?
    end

    def resource_class
      controller_name.classify.constantize
    end

    def build_resource
      resource_class.new(new_resource_params)
    end

    def new_resource_params
      {}
    end
end
