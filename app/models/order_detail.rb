class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  enum makeing_status: {impossible: 0, stay: 1, making: 2, complete: 3}

  validates :makeing_status, :order_price, :quantity, presence: true

  # def subtotal
  #   order_price * quantity
  # end

end
