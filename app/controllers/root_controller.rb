class RootController < ApplicationController
  skip_before_action :authorize

  def index
    flash.keep
    redirect_to next_path
  end

  def search
    @results = Material.search(query).page(params[:page])
  end

  private

  def next_path
    current_user ? profile_path : search_path
  end

  def query
    @query ||= params[:query]
  end
end
