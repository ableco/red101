class Diagnostic < ApplicationRecord
  belongs_to :user
  belongs_to :template

  has_many :answers,   dependent: :destroy
  has_many :questions, through: :answers

  validates :user,     presence: true
  validates :template, presence: true

  after_create :create_answers
  before_save  :finish_and_score, if: :answered?

  scope :pending, -> { where(finished_at: nil) }

  accepts_nested_attributes_for :answers

  def finished?
    persisted? && finished_at.present?
  end

  def pending?
    !finished?
  end

  def answered?
    answers.all?(&:option_id)
  end

  private

  def create_answers
    template.choose_random_question_ids.each do |question_id|
      answers.create(question_id: question_id)
    end
  end

  def finish_and_score
    self.finished_at = Time.current
    self.score       = answers.correct.count
  end
end
