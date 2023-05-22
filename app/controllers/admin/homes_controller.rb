class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @orders = Order.all
    @order = Order.new
  end

  private

  # def order_params
  #   params.require(:order).permit(:order_received_status)
  # end

end
