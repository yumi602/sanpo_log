class ChallengesController < ApplicationController
  before_action :authenticate_user!

  def new
    @themes = Theme.where(active: true).order(:id)
  end

  def create
    existing_challenge = current_user.challenges.find_by(status: :in_progress)
    if existing_challenge.present?
      redirect_to challenge_path, alert: "すでに進行中のチャレンジがあります"
      return
    end

    theme = Theme.find(params[:theme_id])

    current_user.challenges.create!(
      theme: theme,
      progress_count: 0,
      status: :in_progress,
      started_on: Date.current
    )

    redirect_to challenge_path, notice: "チャレンジを開始しました"
  end

  def show
    @challenge = current_user.challenges
                            .where(status: [ :in_progress, :completed ])
                            .order(created_at: :desc)
                            .first

    if @challenge.nil?
      redirect_to new_challenge_path, alert: "チャレンジがありません"
      nil
    end
  end

  def history
    @completed_challenges = current_user.challenges
                                        .where(status: :completed)
                                        .order(completed_at: :desc)
  end
end
