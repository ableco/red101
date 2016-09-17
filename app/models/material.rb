class Material < ApplicationRecord
  SLUG_LENGTH = 4

  include PgSearch

  belongs_to :topic
  has_many   :visits

  validates :title,       presence: true
  validates :url,         presence: true
  validates :description, presence: true

  pg_search_scope :search_by_query, against: %i(title url description),
                                    associated_against: { topic: %i(name) },
                                    using: { tsearch: { prefix: true } }

  before_create :set_slug

  def self.search(query)
    if query.present?
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
