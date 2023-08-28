class Public::PrefectureController < ApplicationController
  before_action :authenticate_customer!
  
  def show
    @prefectures = Prefecture.page(params[:page])
    @prefecture = Prefecture.find(params[:id])
    @posts = SkiResort.where(prefecture_id: params[:id])
  end
end
