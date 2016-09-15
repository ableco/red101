class TrackVisitJob < ApplicationJob
  queue_as :default

  def perform(material_id, user_id, referrer)
    Visit.create(material_id: material_id, user_id: user_id, referrer: referrer)
  end
end
