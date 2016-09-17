module RequireTopics
  extend ActiveSupport::Concern

  included do
    before_action :require_topics
  end

  private

  def require_topics
    return true unless Topic.all.empty?

    respond_to do |format|
      format.js   { head :bad_request }
      format.json { render json: { errors: [error_message] }, status: :bad_request }
      format.html { redirect_to(new_topic_path, alert: error_message) }
    end
  end

  def error_message
    t('error.require_topics.message')
  end
end
