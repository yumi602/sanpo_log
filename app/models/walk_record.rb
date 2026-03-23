class WalkRecord < ApplicationRecord
  belongs_to :user

  enum mood: { good: 0, normal: 1, bad: 2, excited: 3, tired: 4 }

  def mood_label
    case mood
    when "good"
      "良い"
    when "normal"
      "ふつう"
    when "bad"
      "悪い"
    when "excited"
      "楽しい"
    when "tired"
      "疲れた"
    end
  end

  validates :walked_on, presence: true
  validates :body, presence: true
end
