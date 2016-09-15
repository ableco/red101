class RootController < ApplicationController
  skip_before_action :authorize

  def index
    flash.keep
    redirect_to next_path
  end

  def search
    @query   = params[:query]
    @results = Material.search(@query).page(params[:page])
  end

  def go
    material = Material.find_by!(params.permit(:slug))
    TrackVisitJob.perform_later(material.id, current_user.id, request.referrer)
    redirect_to material.url
  end

  private

  def next_path
    if current_user
      if current_user.admin?
        admin_path
      else
        profile_path
      end
    else
      search_path
    end
  end
end
