class Question < ApplicationRecord
  belongs_to :topic

  has_many :options, dependent: :destroy
  has_many :answers, dependent: :destroy

  validates :content, presence: true
  validate  :options_presence

  accepts_nested_attributes_for :options, allow_destroy: true

  private

  def options_presence
    errors.add(:base, :options_presence) if topics.empty?
  end
end
