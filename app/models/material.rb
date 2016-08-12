class Material < ApplicationRecord
  include PgSearch

  belongs_to :topic

  validates :title,   presence: true
  validates :url,     presence: true
  validates :details, presence: true

  pg_search_scope :search_by_query,
                  against: %i( title url details ),
                  associated_against: {
                    topic: %i( name )
                  }
end
