class WalkRecordsController < ApplicationController
  before_action :authenticate_user!

  def index
    @walk_records = current_user.walk_records.order(walked_on: :desc, created_at: :desc)
    @current_challenge = current_user.challenges.find_by(status: :in_progress)
    @completed_challenge = if @current_challenge.nil?
                            current_user.challenges.where(status: :completed).order(completed_at: :desc).first
    end

    @completed_challenges_count = current_user.challenges.completed.count
  end

  def new
    @walk_record = WalkRecord.new
  end

  def create
    @walk_record = current_user.walk_records.build(walk_record_params)

    if @walk_record.save
      update_challenge_progress
      redirect_to walk_records_path, notice: "散歩記録を投稿しました"
    else
      flash.now[:alert] = "散歩記録を投稿できませんでした"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @walk_record = current_user.walk_records.find(params[:id])
  end

  def edit
    @walk_record = current_user.walk_records.find(params[:id])
  end

  def update
    @walk_record = current_user.walk_records.find(params[:id])

    if @walk_record.update(walk_record_params)
      redirect_to walk_record_path(@walk_record), notice: "散歩記録を更新しました"
    else
      flash.now[:alert] = "散歩記録を更新できませんでした"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @walk_record = current_user.walk_records.find(params[:id])
    @walk_record.destroy

    redirect_to walk_records_path, notice: "散歩記録を削除しました"
  end

  private

  def walk_record_params
    params.require(:walk_record).permit(:title, :body, :walked_on, :mood)
  end
  def update_challenge_progress
    current_challenge = current_user.challenges.find_by(status: :in_progress)
    return if current_challenge.nil?

    same_day_records_count = current_user.walk_records.where(walked_on: @walk_record.walked_on).count
    return unless same_day_records_count == 1

    current_challenge.progress_count += 1

    if current_challenge.progress_count >= 7
      current_challenge.status = :completed
      current_challenge.completed_at = Time.current
    end

    current_challenge.save!
  end
end
