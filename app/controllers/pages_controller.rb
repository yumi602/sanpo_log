class PagesController < ApplicationController
  def home
    flash.now[:notice] = "フラッシュメッセージの表示確認です"
  end
end
