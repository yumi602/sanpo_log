class WalkRecordsController < ApplicationController
  before_action :authenticate_user!

  def new
    @walk_record = WalkRecord.new
  end

  def create
    @walk_record = current_user.walk_records.build(walk_record_params)

    if @walk_record.save
      redirect_to root_path, notice: "散歩記録を投稿しました"
    else
      flash.now[:alert] = "散歩記録を投稿できませんでした"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def walk_record_params
    params.require(:walk_record).permit(:title, :body, :walked_on, :mood)
  end
end
