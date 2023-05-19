class Public::DeliveriesController < ApplicationController

  def index
    @deliveries = Delivery.all
    @delivery = Delivery.new
  end

  def edit
  end

  def create
    @delivery = Delivery.new(delivery_params)
    # @delivery.customer_id = current_customer.id
    if @delivery.save!
      redirect_to request.referer
    else
      @deliveries = Delivery.all
      render :index
    end
  end

  def update
  end

  def destroy
    @delivery = Delivery.find(params[:id])
    @delivery.destroy
    redirect_to request.referer
  end

  private
  def delivery_params
    params.require(:delivery).permit(:postal_code, :address, :address_name)
  end
end
