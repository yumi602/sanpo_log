class WeeklyReflectionTarget
  def initialize(user:, start_date:, end_date:)
    @user = user
    @start_date = start_date
    @end_date = end_date
  end

  def records
    @user.walk_records.where(walked_on: @start_date..@end_date).order(:walked_on)
  end

  def prompt_text
    records.map do |record|
      "#{record.walked_on} / 気分: #{record.mood} / コメント: #{record.body}"
    end.join("\n")
  end

  def record_count
    records.count
  end

  def empty?
    records.empty?
  end
end
