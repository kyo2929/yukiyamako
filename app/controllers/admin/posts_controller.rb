class Admin::PostsController < ApplicationController
  def index
    @customer = current_customer
    @posts = Post.all
    @ski_resorts = SkiResort.all
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
