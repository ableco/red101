class Api::V1Controller < ApiController
  before_action :resource

  private

    def resource
      instance_variable_get("@#{ ivar_name }") ||
      instance_variable_set("@#{ ivar_name }", (find_resource || build_resource))
    end

    def ivar_name
      resource_class.model_name.singular
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
