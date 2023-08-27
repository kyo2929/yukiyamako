class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_guest_user, only: %i[edit new]
  before_action :is_matching_login_customer, only: [:edit, :update]
  
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(current_customer.id)
    if @customer.update(customer_params)
      flash[:alert] = '更新しました'
      redirect_to customer_path(@customer.id)
    else
      flash[:notice] = @customer.errors.full_messages
      redirect_to edit_customer_path(@customer.id)
    end
  end

  def confirm_withdraw; end

  def withdraw
    @customer = Customer.find(current_customer.id)
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def ensure_guest_user
    @customer = Customer.find(current_customer.id)
    return unless @customer.guest_user?

    redirect_to root_path, notice: 'ゲストユーザーはこのアクションは実行できません。'
  end

  def favorites
    @customer = Customer.find(current_customer.id)
    favorites = Favorite.where(customer_id: @customer.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :introduction, :profile_image)
  end
  
  def is_matching_login_customer
    customer = Customer.find(params[:id])
    unless customer.id == current_customer.id
      redirect_to posts_path
    end
  end
  
end
