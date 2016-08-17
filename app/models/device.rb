class Device < ApplicationRecord
  attr_accessor :email, :password, :skip_authentication

  has_secure_token

  belongs_to :user

  enum kind: {
    browser: 0
  }

  validates :user, presence: true

  before_validation :authenticate, on: :create, unless: :skip_authentication
  before_validation :set_description

  scope :active, -> { where('expires_at IS NULL OR expires_at > :now', now: Time.current) }

  def self.current(token)
    active.find_or_initialize_by(token: token).tap do |device|
      device.sign_out! if device.expired?
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

  def sign_out!
    update(expires_at: nil, user: nil, skip_authentication: true)
  end

  private

  def authenticate
    candidate = User.find_by(email: email) if email.present? && password.present?

    if candidate&.authenticate(password)
      self.user = candidate
    end
  end

  def set_description
    self.description = kind unless description.present?
  end
end
