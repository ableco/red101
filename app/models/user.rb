class User < ApplicationRecord
  EMAIL_FORMAT = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  include PgSearch

  has_secure_password

  has_many :devices,     dependent: :destroy
  has_many :diagnostics, dependent: :destroy
  has_many :visits,      dependent: :destroy

  validates :name,  presence: true
  validates :email, presence: true, uniqueness: true, format: { with: EMAIL_FORMAT }

  pg_search_scope :search_by_query, against: %i(name email),
                                    using: { tsearch: { prefix: true } }

  def self.search(query)
    if query.present?
      search_by_query(query)
    else
      order(name: :asc)
    end
  end

  def create_device
    devices.create(skip_authentication: true)
  end

  def pending_diagnostic_for(template_id)
    diagnostics.pending.find_by(template_id: template_id)
  end
end
