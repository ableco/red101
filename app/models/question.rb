class Question < ApplicationRecord
  include PgSearch

  belongs_to :topic

  has_many :options, dependent: :destroy
  has_many :answers, dependent: :destroy

  validates :content, presence: true
  validate  :options_presence

  accepts_nested_attributes_for :options, allow_destroy: true

  scope :random, ->(limit) { order('RANDOM()').limit(limit) }

  pg_search_scope :search_by_query, against: %i(content),
                                    associated_against: { options: %i(content) },
                                    using: { tsearch: { prefix: true } }

  def self.search(query)
    if query.present?
      search_by_query(query)
    else
      order(title: :asc)
    end
  end

  private

  def options_presence
    errors.add(:base, :options_presence) if options.empty?
  end
end
