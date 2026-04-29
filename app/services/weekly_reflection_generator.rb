require "openai"

class WeeklyReflectionGenerator
  def initialize(prompt_text:)
    @prompt_text = prompt_text
  end

  def call
    client = OpenAI::Client.new

    response = client.responses.create(
      model: "gpt-4o-mini",
      input: build_prompt
    )

    response.output_text
  end

  private

  def build_prompt
    <<~TEXT
    以下は1週間の散歩記録です。
    この内容をもとに、次の3つを日本語で作成してください。

    ・今週の要約
    ・気分や行動の傾向
    ・次週に向けたやさしい一言

    ----

    #{@prompt_text}
    TEXT
  end
end