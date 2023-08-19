class Public::PrefectureController < ApplicationController
  def show
    @prefectures = Prefecture.all
    @prefecture = Prefecture.find(params[:id])
    @posts = SkiResort.where(prefecture_id: params[:id])
  end
end
