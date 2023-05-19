class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    # @addresses = current_member.addresses.all
  end

  def create
    @order = Order.new(order_params)
    @order.customer.id = @order.customer.id
    @order.save
    redirect_to customers_confirm_path
  end

  def complete
  end

  private

  def order_params
    params.requier(:order).permit(:address_name, :address, :postal_code, :payment_method)
  end

end
