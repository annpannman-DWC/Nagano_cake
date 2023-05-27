class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
    if @order.update(order_params)
      # 受注ステータスが「入金確認」の時、製作ステータスを全て「製作待ち」に更新する
      @order_details.update_all(makeing_status: 1) if @order.order_received_status == "check"
    end
    redirect_to admin_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:order_received_status)
  end

end
