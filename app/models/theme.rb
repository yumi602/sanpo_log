class Theme < ApplicationRecord
  has_many :challenges, dependent: :restrict_with_exception

  validates :name, presence: true

  def progress_icon
    case key
    when "sakura"
      "🌸"
    when "dog"
      "🐶"
    when "cat"
      "🐱"
    when "sea"
      "🌊"
    when "coffee"
      "☕"
    when "momiji"
      "🍁"
    else
      "✨"
    end
  end

  def completion_message
    case key
    when "sakura"
      "🌸 桜の風景が完成しました！"
    when "dog"
      "🐶 わんちゃんの風景が完成しました！"
    when "cat"
      "🐱 ねこの風景が完成しました！"
    when "sea"
      "🌊 海の風景が完成しました！"
    when "coffee"
      "☕ カフェの風景が完成しました！"
    when "momiji"
      "🍁 紅葉の風景が完成しました！"
    else
      "🎉 テーマ画像が完成しました！"
    end
  end
end
