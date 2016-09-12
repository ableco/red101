class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  default_form_builder Red101FormBuilder

  include Auth

  private

  def token
    cookies[:token]
  end
end
