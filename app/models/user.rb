class User < ApplicationRecord
  EMAIL_FORMAT = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  has_secure_password

  has_many :devices,     dependent: :destroy
  has_many :diagnostics, dependent: :destroy
  has_many :visits,      dependent: :destroy

  validates :name,  presence: true
  validates :email, presence: true, uniqueness: true, format: { with: EMAIL_FORMAT }

  def create_device
    devices.create(skip_authentication: true)
  end

  def pending_diagnostic_for(template_id)
    diagnostics.pending.find_by(template_id: template_id)
  end
end
