class Diagnostic < ApplicationRecord
  belongs_to :user
  belongs_to :template

  has_many :answers,   dependent: :destroy
  has_many :questions, through: :answers

  validates :user,     presence: true
  validates :template, presence: true

  after_create :create_answers

  private

    def create_answers
      template.choose_random_question_ids.each do |question_id|
        answers.create(question_id: question_id)
      end
    end
end
