class Order < ApplicationRecord
  
  belongs_to :customer
  has_many :order_items, dependent: :destroy

  # 注文ステータス
  enum status: { payment_waiting: 0, payment_confirmation: 1, in_production: 2, preparing_delivery: 3, delivered: 4 }
  
  # 支払い方法
  enum payment_method: { credit_card: 0, transfer: 1 }
  
  validates :address, presence: true
  validates :postal_code, presence: true, length: { minimum: 0, maximum: 7 }
  validates :address_name, presence: true
end
