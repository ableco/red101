class Option < ApplicationRecord
  belongs_to :question

  has_many :answers, dependent: :nullify
end
