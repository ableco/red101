class Visit < ApplicationRecord
  belongs_to :material, counter_cache: true
  belongs_to :user
end
