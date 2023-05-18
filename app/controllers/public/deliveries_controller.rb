class Public::DeliveriesController < ApplicationController

  def index
    @deliveries = Delivery.all
    @delivery = Delivery.new
  end

  def edit
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.save
    redirect_to request.referer
  end

  def update
  end

  def destroy
  end

end
