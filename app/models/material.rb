class Material < ApplicationRecord
  belongs_to :topic

  validates :title,    presence: true
  validates :url,      presence: true
  validates :details,  presence: true
end
