class TopicsController < ApplicationController
  include Rest

  def index
    @topics = Topic.order(name: :asc)
  end

  private

  def permitted_attributes
    %i(name)
  end
end
