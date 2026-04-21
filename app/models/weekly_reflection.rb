class WeeklyReflection < ApplicationRecord
  belongs_to :user

  validates :start_date, :end_date, presence: true
  validates :start_date, uniqueness: { scope: [ :user_id, :end_date ] }
end
