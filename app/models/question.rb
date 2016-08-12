class Question < ApplicationRecord
  belongs_to :topic

  has_many :options, dependent: :destroy
  has_many :answers, dependent: :destroy

  validates :content, presence: true

  accepts_nested_attributes_for :options
end
