class Diagnostic < ApplicationRecord
  belongs_to :user
  belongs_to :template

  has_many :answers, dependent: :destroy
end
