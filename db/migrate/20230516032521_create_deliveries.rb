class CreateDeliveries < ActiveRecord::Migration[6.1]
  def change
    create_table :deliveries do |t|
      t.integer :customer_id, null: false
      t.string :address_name, null: false, default: ""
      t.text :address,        null: false, default: ""
      t.string :postal_code,  null: false, default: ""

      t.timestamps
    end
  end
end
