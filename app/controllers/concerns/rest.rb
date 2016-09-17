module Rest
  extend ActiveSupport::Concern

  def create
    resource.attributes = resource_params

    if resource.save
      created
      success
    else
      failure
    end
  end

  def update
    if resource.update(resource_params)
      updated
      success
    else
      failure
    end
  end

  def destroy
    if resource.destroy
      deleted
      success
    else
      failure
    end
  end

  private

  def success
    respond_to do |format|
      format.js
      format.json { json_success }
      format.html { redirect_to(after_path, notice: success_notice) }
    end
  end

  def failure
    respond_to do |format|
      format.js
      format.json { json_failure }
      format.html { render(resource.new_record? ? :new : :edit) }
    end
  end

  def json_success
    case action_name.to_sym
    when :create  then render(:show, status: :created)
    when :update  then render(:show, status: :ok)
    when :destroy then head(:ok)
    end
  end

  def json_failure
    render json: { errors: resource.errors.messages }, status: :unprocessable_entity
  end

  def resource
    instance_variable_get("@#{param_key}") ||
      instance_variable_set("@#{param_key}", (find_resource || build_resource))
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
    resource_class.new(build_params)
  end

  def build_params
    {}
  end

  def resource_params
    params.require(param_key).permit(permitted_attributes)
  end

  def permitted_attributes
    []
  end

  def success_notice
    t('.success_notice', default: '')
  end

  def after_path
    url_for(controller: controller_name, action: :index)
  end

  def created; end

  def updated; end

  def deleted; end
end
