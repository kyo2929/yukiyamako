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

  private

  def customer_params
    params.require(:customer).permit(:name,:email)
  end

  def ensure_guest_user
    @user = Customer.find(params[:id])
    if @user.guest_user?
      redirect_to root_path , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end

end
