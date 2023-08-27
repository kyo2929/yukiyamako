class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    if params[:latest]
      @posts = Post.latest
    elsif params[:old]
      @posts = Post.old
    elsif params[:star_count]
      @posts = Post.star_count
    else
      @customer = current_customer
      @posts = Post.page(params[:page])
      @ski_resorts = SkiResort.all
    end
  end

  def show
    @post = Post.find(params[:id])
    @customer = @post.customer
    @ski_resorts = SkiResort.all
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
  end
end
