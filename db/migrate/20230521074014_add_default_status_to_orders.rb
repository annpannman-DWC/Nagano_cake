class AddDefaultStatusToOrders < ActiveRecord::Migration[6.1]
  def change
    change_column_default :orders, :order_received_status, 0
  end
end