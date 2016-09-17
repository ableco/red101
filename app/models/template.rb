class Template < ApplicationRecord
  has_many :diagnostics, dependent: :destroy
  has_many :references,  dependent: :destroy

  has_many :topics, through: :references

  validates :name, presence: true
  validate  :topics_presence

  private

  def topics_presence
    errors.add(:base, :topics_presence) if topics.empty?
  end
end
