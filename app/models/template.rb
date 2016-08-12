class Template < ApplicationRecord
  has_many :diagnostics, dependent: :destroy
  has_many :references,  dependent: :destroy

  has_many :topics, through: :references

  validates :name, presence: true
end
