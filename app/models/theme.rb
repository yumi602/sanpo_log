class Theme < ApplicationRecord
  has_many :challenges, dependent: :restrict_with_exception

  validates :name, presence: true

  def image_key
    case name
    when "桜"
      "sakura"
    when "紅葉"
      "momiji"
    when "海"
      "sea"
    when "カフェ"
      "coffee"
    when "猫"
      "cat"
    when "犬"
      "dog"
    end
  end
end
