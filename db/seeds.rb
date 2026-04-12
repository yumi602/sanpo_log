themes = [
  {
    name: "桜",
    key: "sakura",
    description: "散歩記録を7回投稿して、桜のボード完成を目指すチャレンジです。",
    image_path: "puzzles/sakura/sakura.png",
    active: true
  },
  {
    name: "紅葉",
    key: "momiji",
    description: "散歩記録を7回投稿して、紅葉のボード完成を目指すチャレンジです。",
    image_path: "puzzles/momiji/momiji.png",
    active: true
  },
  {
    name: "海",
    key: "sea",
    description: "散歩記録を7回投稿して、海のボード完成を目指すチャレンジです。",
    image_path: "puzzles/sea/sea.png",
    active: true
  },
  {
    name: "カフェ",
    key: "coffee",
    description: "散歩記録を7回投稿して、カフェのボード完成を目指すチャレンジです。",
    image_path: "puzzles/coffee/coffee.png",
    active: true
  },
  {
    name: "猫",
    key: "cat",
    description: "散歩記録を7回投稿して、猫のボード完成を目指すチャレンジです。",
    image_path: "puzzles/cat/cat.png",
    active: true
  },
  {
    name: "犬",
    key: "dog",
    description: "散歩記録を7回投稿して、犬のボード完成を目指すチャレンジです。",
    image_path: "puzzles/dog/dog.png",
    active: true
  }
]

themes.each do |attrs|
  theme = Theme.find_or_initialize_by(name: attrs[:name])
  theme.key = attrs[:key]
  theme.description = attrs[:description]
  theme.image_path = attrs[:image_path]
  theme.active = attrs[:active]
  theme.save!
end
