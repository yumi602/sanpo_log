class ChallengesController < ApplicationController
  before_action :authenticate_user!

  def new
    @theme = Theme.find_by!(name: "桜")
  end

  def create
    existing_challenge = current_user.challenges.find_by(status: :in_progress)
    if existing_challenge.present?
      redirect_to challenge_path, alert: "すでに進行中のチャレンジがあります"
      return
    end

    theme = Theme.find_by!(name: "桜")
    current_user.challenges.create!(
      theme: theme,
      progress_count: 0,
      status: :in_progress,
      started_on: Date.current
    )

    redirect_to challenge_path, notice: "チャレンジを開始しました"
  end

  def show
    @challenge = current_user.challenges.find_by(status: :in_progress)
    if @challenge.nil?
      redirect_to new_challenge_path, alert: "進行中のチャレンジがありません"
      nil
    end
  end
end
