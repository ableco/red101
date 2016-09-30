class RootController < ApplicationController
  skip_before_action :authorize

  def index; end

  def search
    @query = params[:query]
    @items = Material.includes(:topic).search(@query).page(params[:page])
  end

  def diagnose
    @items = Template.order(name: :asc)
  end

  def configure
    @user   = User.new
    @device = Device.new
  end

  def visit
    material = Material.find_by!(params.permit(:slug))
    TrackVisitJob.perform_later(material.id, current_user.id, request.referer) if current_user
    redirect_to material.url
  end
end
