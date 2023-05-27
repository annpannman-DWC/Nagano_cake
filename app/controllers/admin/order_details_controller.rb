class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details.all

    is_updated = true
    if @order_detail.update(order_detail_params)
      #製作ステータスが「製作中」の時、受注ステータスを「製作中」に更新する
      @order.update(order_received_status: 2) if @order_detail.makeing_status == "making"
      @order_details.each do |order_detail|
        #製作ステータスが「製作完了」ではない場合
        if order_detail.makeing_status != "complete"
          is_updated = false
        end
      end
      #is_updatedがtrueの場合受注ステータスを「発送準備中」に更新する
      @order.update(order_received_status: 3) if is_updated
    end
    redirect_to admin_order_path(@order)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:makeing_status)
  end

end
