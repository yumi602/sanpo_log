class WalkRecordsController < ApplicationController
  before_action :authenticate_user!

  def index
    @walk_records = current_user.walk_records.order(walked_on: :desc, created_at: :desc)
    @current_challenge = current_user.challenges.find_by(status: :in_progress)
  end

  def new
    @walk_record = WalkRecord.new
  end

  def create
    @walk_record = current_user.walk_records.build(walk_record_params)

    if @walk_record.save
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
end
