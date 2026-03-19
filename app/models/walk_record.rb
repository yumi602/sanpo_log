class WalkRecord < ApplicationRecord
  belongs_to :user

  enum :mood, { good: 0, normal: 1, tired: 2, sad: 3 }

  validates :walked_on, presence: true
  validates :body, presence: true
end
