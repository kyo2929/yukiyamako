class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_guest_user, only: [:edit]
  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(current_customer.id)
    if @customer.update(customer_params)
      flash[:alert] ="更新しました"
      redirect_to customers_mypage_path
    else
      flash[:notice] = @customer.errors.full_messages
      redirect_to customers_information_edit_path
    end
  end

  def confirm_withdraw
  end

  def withdraw
    @customer = Customer.find(current_customer.id)
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def ensure_guest_user
    @customer = Customer.find(current_customer.id)
    if @customer.guest_user?
      redirect_to root_path , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end

  def favorites
    @customer = Customer.find(current_customer.id)
    favorites= Favorite.where(customer_id: @customer.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :introduction, :profile_image)
  end



end
