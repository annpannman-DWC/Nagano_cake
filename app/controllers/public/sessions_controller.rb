# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :configure_customer_status, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # ゲストログイン機能
  def guest_login
    guest_user = Customer.find_or_create_by(first_name: "guest", last_name: "user", email: "guest@example.com") do |customer|
      customer.password = SecureRandom.urlsafe_base64
    end
    sign_in guest_user
    redirect_to customers_mypage_path, notice: "guestuserでログインしました。"
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  private

    # 退会してた場合にサインアップできないようにするメソッド
  def configure_customer_status
    @customer = Customer.find_by(email: params[:customer][:email])
    return if !@customer
    if @customer.valid_password?(params[:customer][:password]) && @customer.is_deleted?
      redirect_to new_customer_registration_path, notice: "退会済みです。再度サインアップしてください。"
    else
      create
    end
  end

end
