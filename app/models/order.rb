class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_items, dependent: :destroy

  # 受注ステータス
  enum order_received_status: { wait: 0, check: 1, making: 2, standby: 3, sent: 4 }

  # 支払い方法
  enum payment_method: { credit_card: 0, transfer: 1 }


  validates :address, presence: true
  validates :postal_code, presence: true, length: { minimum: 0, maximum: 7 }
  validates :address_name, presence: true
end
