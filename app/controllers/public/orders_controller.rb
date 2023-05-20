class Public::OrdersController < ApplicationController

  def index
   @orders = current_customer.orders
  end

  def new
    @order = Order.new
    @deliveries = current_customer.deliveries
    @payment_methods = {
      credit_card: I18n.t("order.payment_methods.credit_card"),
      transfer: I18n.t("order.payment_methods.transfer"),
      # cash_on_delivery: I18n.t("order.payment_methods.cash_on_delivery")
    }
  end

  def confirm
    @order = Order.new(order_params)
    @order.payment_method = params[:order][:payment_method].to_i
    @order.shipping_cost = 800
    @cart_items = current_customer.cart_items
    # @cart_items = CartItem.where(customer_id: current_customer.id)

    # 配送先の条件分岐
    if params[:order][:address_option] == "0"   # 自分の住所
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.address_name = current_customer.full_name
    elsif params[:order][:address_option] == "1"  # 登録している配送先
      @address = Address.find(params[:order][:address_id])
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
    @order.shipping_cost = 800
    if @order.save
      @cart_items = current_customer.cart_items
      @cart_items.each do |cart_item|
        @order_item = OrderItem.new
        @order_item.order_id = @order.id
        @order_item.item_id = cart_item.item_id
        @order_item.quantity = cart_item.quantity
        @order_item.purchase_price = cart_item.item.price_without_tax * cart_item.quantity * 1.1
        @order_item.save
      end
      @cart_items.destroy_all #カートのデータ全て削除
      redirect_to destroy_all_cart_items_path
    else
      @order = Order.new(order_params)
      render :new
    end
  end

    # redirect_to thanx_path

  def show
    #@order = Order.find(params[:id])
  end

  def confirm
  end

  def thanx
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :address_name, :payment_method, :total_price, :order_received_status)
  end

end
