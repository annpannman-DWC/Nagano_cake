class Admin::OrderDetailsController < ApplicationController

  def update
    @order = Order.find(params[:id])
    @order_detail = OrderDetail.new
    @order_detail.update(order_detail_params)
    redirect_to admin_order_path(@order)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:makeing_status)
  end

end
