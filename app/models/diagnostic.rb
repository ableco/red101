class Diagnostic < ApplicationRecord
  FAILURE_THRESHOLD = 2

  belongs_to :user
  belongs_to :template

  has_many :answers,   dependent: :destroy
  has_many :questions, through: :answers

  validates :user,     presence: true
  validates :template, presence: true

  before_save  :finish, if: :answered?
  after_create :create_answers

  scope :pending, -> { where(finished_at: nil) }

  accepts_nested_attributes_for :answers

  def finished?
    persisted? && finished_at.present?
  end

  def pending?
    !finished?
  end

  def answered?
    persisted? && answers.all?(&:option_id)
  end

  def annonymous?
    user_id.nil?
  end

  def recent?
    created_at > 1.day.ago
  end

  def score
    answers.correct.count
  end

  def recommendations
    Material.where(topic_id: recommended_topic_ids)
  end

  private

  def recommended_topic_ids
    answers.incorrect.group_by(&:topic_id).map do |topic_id, topic_answers|
      topic_id if topic_answers.length > FAILURE_THRESHOLD
    end
  end

  def create_answers
    template.choose_random_question_ids.each do |question_id|
      answers.create(question_id: question_id)
    end
  end

  def finish
    self.finished_at = Time.current
  end
end
