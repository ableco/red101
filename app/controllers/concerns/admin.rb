module Admin
  extend ActiveSupport::Concern

  included do
    before_action :check_topics
  end

  private

  def check_topics
    redirect_to new_topic_path, alert: t('errors.admin.topic_required') if Topic.all.empty?
  end
end
