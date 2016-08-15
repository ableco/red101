class Template < ApplicationRecord
  has_many :diagnostics, dependent: :destroy
  has_many :references,  dependent: :destroy

  has_many :topics, through: :references

  validates :name, presence: true

  def choose_random_question_ids
    topics.flat_map { |topic| topic.questions.order('RANDOM()').limit(question_limit).pluck(:id) }
  end
end
