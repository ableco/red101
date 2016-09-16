class Material < ApplicationRecord
  SLUG_LENGTH = 4

  include PgSearch

  belongs_to :topic
  has_many   :visits

  validates :title,   presence: true
  validates :url,     presence: true
  validates :details, presence: true

  pg_search_scope :search_by_query, against: %i(title url details),
                                    associated_against: {
                                      topic: %i(name)
                                    }

  before_create :set_slug

  def self.search(query)
    if query
      search_by_query(query)
    else
      order(title: :asc)
    end
  end

  private

  def set_slug
    loop do
      self.slug = SecureRandom.urlsafe_base64(SLUG_LENGTH)
      break unless self.class.exists?(slug: slug)
    end
  end
end
