class Topic < ApplicationRecord
  has_many :materials,  dependent: :destroy
  has_many :references, dependent: :destroy
  has_many :templates,  through: :references

  validates :name, presence: true
end
