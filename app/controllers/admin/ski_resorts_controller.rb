class Admin::SkiResortsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @ski_resorts = SkiResort.page(params[:page])
    @prefecture = Prefecture.all
  end

  def show
    @ski_resort = SkiResort.find(params[:id])
  end

  def new
    @ski_resort = SkiResort.new
    @prefecture = Prefecture.all
  end

  def edit
    @ski_resort = SkiResort.find(params[:id])
    @prefecture = Prefecture.all
  end

  def create
    @ski_resort = SkiResort.new(ski_resort_params)
    @prefecture = Prefecture.all
    if @ski_resort.save
      redirect_to admin_ski_resort_path(@ski_resort.id)
    else
      render :new
    end
  end

  def update
    @ski_resort = SkiResort.find(params[:id])
    @prefecture = Prefecture.all
    if @ski_resort.update(ski_resort_params)
      redirect_to admin_ski_resorts_path
    else
      render :edit
    end
  end

  private

  def ski_resort_params
    params.require(:ski_resort).permit(:prefecture_id, :name, :introduction, :address, ski_resort_images: [])
  end
end
