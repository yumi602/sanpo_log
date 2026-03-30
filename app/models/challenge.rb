class Challenge < ApplicationRecord
  belongs_to :user
  belongs_to :theme

  enum status: { in_progress: 0, completed: 1 }

  validates :started_on, presence: true
  validates :progress_count,
            numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 7 }
end
