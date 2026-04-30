class WeeklyReflectionGenerator
  def initialize(user:, start_date:, end_date:)
    @user = user
    @start_date = start_date
    @end_date = end_date
  end

  def call
    target = WeeklyReflectionTarget.new(
      user: @user,
      start_date: @start_date,
      end_date: @end_date
    )

    client = OpenAI::Client.new

    response = client.responses.create(
      model: "gpt-4o-mini",
      input: build_prompt(target.prompt_text)
    )

    parsed = parse_response(response.output_text)

    save_reflection(parsed)
  end

  private

  def build_prompt(prompt_text)
    <<~TEXT
    以下は1週間の散歩記録です。
    この内容をもとに、次の3つを日本語で作成してください。

    ・今週の要約
    ・気分や行動の傾向
    ・次週に向けたやさしい一言

    ----

    #{prompt_text}
    TEXT
  end

  def parse_response(text)
    parts = text.split("### ")

    {
      summary: parts[1]&.split("\n", 2)&.last&.strip,
      analysis: parts[2]&.split("\n", 2)&.last&.strip,
      encouragement: parts[3]&.split("\n", 2)&.last&.strip
    }
  end

  def save_reflection(data)
    WeeklyReflection.find_or_initialize_by(
      user: @user,
      start_date: @start_date,
      end_date: @end_date
    ).tap do |reflection|
      reflection.summary = data[:summary]
      reflection.analysis = data[:analysis]
      reflection.encouragement = data[:encouragement]
      reflection.save!
    end
  end
end
