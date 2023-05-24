class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details, dependent: :destroy

  # 受注ステータス
  enum order_received_status: { wait: 0, check: 1, making: 2, standby: 3, sent: 4 }

  # 支払い方法
  enum payment_method: { credit_card: 0, transfer: 1 }

  validates :shopping_cost, :address_name, :address, :postal_code, :payment_method, :total_price, :order_received_status, presence: true

  def amount
    # 注文商品の合計金額を計算するロジック
    order_details.sum(&:subtotal)
  end

  def order_received_status_i18n
    I18n.t("order_statuses.#{order_received_status}")
  end

  def paid_with_credit_card?
    payment_method == 'credit_card'
  end

  def paid_with_bank_transfer?
    payment_method == 'transfer'
  end

  def order_quantity_count
    total = 0
    order_details.each do |order_detail|
      total += order_detail.quantity
    end
    return total
  end
end
