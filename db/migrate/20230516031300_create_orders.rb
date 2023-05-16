class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id,           null: false
      t.integer :shipping_cost,         null: false
      t.string :address_name,           null: false, default: ""
      t.text :address,                  null: false, default: ""
      t.string :postal_code,            null: false, default: ""
      t.integer :payment_method,        null: false
      t.integer :total_price,           null: false
      t.integer :order_received_status, null: false

      t.timestamps
    end
  end
end
