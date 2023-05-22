class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  validates :makeing_status, :order_price, :quantity, presence: true

end
