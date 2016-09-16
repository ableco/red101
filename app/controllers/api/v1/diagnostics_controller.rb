class Api::V1::DiagnosticsController < Api::V1Controller
  private

  def permitted_attributes
    %i(template_id).push(user_id: current_user.id)
  end
end
