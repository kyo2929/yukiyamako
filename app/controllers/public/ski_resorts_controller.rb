class Public::SkiResortsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @ski_resorts = SkiResort.page(params[:page])
    @prefectures = Prefecture.all
  end

  def show
    @ski_resort = SkiResort.find(params[:id])
    @prefectures = Prefecture.all
  end
end
