class Device < ApplicationRecord
  attr_accessor :email, :password

  has_secure_token

  belongs_to :user

  enum kind: {
    browser: 0
  }

  before_validation :authenticate,
                    :set_description
  validates :user, presence: true

  private

  def authenticate
    candidate = User.find_by(email: email)

    if candidate&.authenticate(password)
      self.user = candidate
    else
      errors.add(:base, :invalid)
    end
  end

  def set_description
    self.description = kind unless description.present?
  end
end
