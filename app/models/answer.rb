class Answer < ApplicationRecord
  belongs_to :diagnostic
  belongs_to :question
  belongs_to :option
end
