class DiagnosticsController < ApplicationController
  include Rest

  def index
    @diagnostics = Diagnostic.order(created_at: :asc).page(params[:page])
  end

  def new
    redirect_to edit_diagnostic_path(pending_diagnostic) if pending_diagnostic
  end

  def show
    redirect_to edit_diagnostic_path(@diagnostic) if @diagnostic.pending?
  end

  private

  def build_params
    params.permit(:template_id).merge(user_id: current_user&.id)
  end

  def permitted_attributes
    %i(template_id reference).push(answers_attributes: %i(id option_id))
  end

  def pending_diagnostic
    current_user.pending_diagnostic_for(@diagnostic.template_id)
  end

  def after_path
    diagnostic_path(@diagnostic)
  end
end
