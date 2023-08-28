class Public::PostsController < ApplicationController
  before_action :authenticate_customer!
  before_action :is_matching_login_customer, only: [:edit, :update]

  def index
    if params[:latest]
      @posts = Post.latest
    elsif params[:old]
      @posts = Post.old
    elsif params[:star_count]
      @posts = Post.star_count
    else
      @posts = Post.page(params[:page])
      @ski_resorts = SkiResort.all
    end

    @posts = @posts.page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
    @customer = @post.customer
    @ski_resorts = SkiResort.all
    @post_comment = PostComment.new
  end

  def new
    @post = Post.new
    @ski_resorts = SkiResort.all
  end

  def edit
    @post = Post.find(params[:id])
    @ski_resorts = SkiResort.all
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    if @post.save
      flash[:notice] = '投稿できました'
      redirect_to post_path(@post.id)
    else
      @posts = Post.all
      @ski_resorts = SkiResort.all
      @customer = current_customer
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = '投稿できました'
      redirect_to post_path(@post.id)
    else
      @ski_resorts = SkiResort.all
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:body, :star, :ski_resort_id, images: [])
  end

  def is_matching_login_customer
    posts = Post.find(params[:id])
    @customer = posts.customer
    unless @customer.id == current_customer.id
      redirect_to posts_path
    end
  end

end
