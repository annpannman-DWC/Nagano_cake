class Public::DeliveriesController < ApplicationController
  before_action :set_delivery, only: %i[edit update destroy]
  before_action :ensure_guest_user

  def index
    @deliveries = current_customer.deliveries
    @delivery = Delivery.new
  end

  def edit
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.customer_id = current_customer.id
    if @delivery.save
      redirect_to request.referer
    else
      @deliveries = Delivery.all
      render :index
    end
  end

  def update
    if @delivery.update(delivery_params)
      redirect_to deliveries_path
    else
      render "edit"
    end
  end

  def destroy
    @delivery.destroy
    redirect_to request.referer
  end

  private

  def set_delivery
     @delivery = Delivery.find(params[:id])
  end

  def delivery_params
    params.require(:delivery).permit(:postal_code, :address, :address_name)
  end
end
