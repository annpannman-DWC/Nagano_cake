class Public::OrdersController < ApplicationController
  before_action :ensure_guest_user

  def index
    @orders = current_customer.orders
  end

  def new
    @order = Order.new
    @deliveries = current_customer.deliveries
    @payment_methods = {
      credit_card: I18n.t("order.payment_methods.credit_card"),
      transfer: I18n.t("order.payment_methods.transfer"),
    }
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def confirm
    @order = Order.new(order_params)
    @order.shopping_cost = 800
    @cart_items = current_customer.cart_items


    #配送先の条件分岐
    if params[:order][:address_option] == "0"   # 自分の住所
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.address_name = current_customer.last_name
    elsif params[:order][:address_option] == "1"  # 登録している配送先
      @address = Delivery.find(params[:order][:delivery_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.address_name = @address.address_name
    elsif params[:order][:address_option] == "2"  # 新たに配送先を指定
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.address_name = params[:order][:address_name]
    end
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.shopping_cost = 800
    if @order.save
      @cart_items = current_customer.cart_items
      @cart_items.each do |cart_item|
        @order_detail = OrderDetail.new
        @order_detail.order_id = @order.id
        @order_detail.item_id = cart_item.item_id
        @order_detail.quantity = cart_item.amount
        @order_detail.order_price = cart_item.item.price * cart_item.amount * 1.1
        @order_detail.makeing_status = 0
        if @order_detail.save
          @cart_items.destroy_all
        end
      end
      redirect_to orders_complete_path
    end
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :address_name, :payment_method, :total_price, :order_received_status)
  end

end
