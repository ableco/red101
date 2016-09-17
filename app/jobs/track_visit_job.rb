class TrackVisitJob < ApplicationJob
  queue_as :default

  def perform(material_id, user_id, referer)
    Visit.create(material_id: material_id, user_id: user_id, referer: referer)
  end
end
