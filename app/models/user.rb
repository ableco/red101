class User < ApplicationRecord
  EMAIL_FORMAT = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  has_secure_password

  has_many :devices,     dependent: :destroy
  has_many :diagnostics, dependent: :destroy
  has_many :visits,      dependent: :destroy

  validates :first_name, presence: true
  validates :last_name,  presence: true
  validates :email,      presence: true, uniqueness: true, format: { with: EMAIL_FORMAT }

  def name
    "#{first_name} #{last_name}"
  end

  def create_device
    devices.create(skip_authentication: true)
  end
end
