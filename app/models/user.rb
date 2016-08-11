class User < ApplicationRecord
  has_secure_password

  has_many :devices,     dependent: :destroy
  has_many :diagnostics, dependent: :destroy
end
