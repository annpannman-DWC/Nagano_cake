class Public::CustomersController < ApplicationController
  before_action :set_customer, only: %i[edit show withdraw]
  before_action :ensure_guest_user, only: %i[edit]
  
  def edit
    # @customer = Customer.new
  end
  
  def show
  end
  
  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to customers_mypage_path
  end
  
  def confirm
  end
  
  def withdraw
    @customer.update(is_deleted: true)
    reset_session
    redirect_to new_customer_registration_path, notice: "退会に成功しました。"
  end
  
  private
  
  def set_customer
    @customer = current_customer
  end
  
  def customer_params
    params.require(:customer).permit(:email, :first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :phone_number)
  end
  
  def ensure_guest_user
    if @customer.first_name + @customer.last_name == "guestuser"
      redirect_to customers_mypage_path , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end  
  
end