class Option < ApplicationRecord
  belongs_to :question

  has_many :answers, dependent: :nullify

  validates :content, presence: true
end
