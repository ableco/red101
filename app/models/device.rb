class Device < ApplicationRecord
  attr_accessor :email, :password, :skip_authentication

  has_secure_token

  belongs_to :user
  validates  :user, presence: true

  enum kind: {
    browser: 0
  }

  before_validation :authenticate, unless: :skip_authentication

  scope :active, -> { where('expires_at IS NULL OR expires_at > :now', now: Time.current) }

  def self.current(token, user_agent)
    active.find_or_initialize_by(token: token).tap do |device|
      device.user_agent = user_agent
    end
  end

  def current_user
    user unless new_record? || expired?
  end

  def expired?
    expires_at && expires_at < Time.current
  end

  def expire!
    update(expires_at: Time.current, skip_authentication: true)
  end

  private

  def authenticate
    candidate = User.find_by(email: email) if email.present? && password.present?

    if candidate&.authenticate(password)
      self.user       = candidate
      self.expires_at = nil
    else
      errors.add(:base, :invalid_credentials)
    end
  end
end
