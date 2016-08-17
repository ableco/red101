class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include Auth

  private

  def token
    cookies[:token]
  end
end
