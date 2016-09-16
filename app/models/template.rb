class Template < ApplicationRecord
  has_many :diagnostics, dependent: :destroy
  has_many :references,  dependent: :destroy

  has_many :topics, through: :references

  validates :name, presence: true
  validate  :topics_presence

  def choose_random_question_ids
    topics.flat_map do |topic|
      topic.questions.order('RANDOM()').limit(question_limit).pluck(:id)
    end
  end

  private

  def topics_presence
    errors.add(:base, :topics_presence) if topics.empty?
  end
end
