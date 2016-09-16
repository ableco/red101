class Answer < ApplicationRecord
  belongs_to :diagnostic, counter_cache: true
  belongs_to :question
  belongs_to :option

  before_save :cache_option_values, if: :option

  scope :correct, -> { where(option_correct: true) }

  private

  def cache_option_values
    self.option_content = option.content
    self.option_correct = option.correct
  end
end
