class Question < ApplicationRecord
  belongs_to :topic

  has_many :options, dependent: :destroy
  has_many :answers, dependent: :destroy
end
