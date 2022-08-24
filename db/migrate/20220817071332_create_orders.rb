class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.string :shipping_post_code, null: false
      t.text :shipping_address, null: false
      t.string :shipping_address_name, null: false
      t.integer :shipping_charge, null: false
      t.integer :total_payment, null: false
      t.integer :payment_method, null: false, default: "0"
      t.integer :order_status, null: false, default: "0"

      t.timestamps
    end
  end
end
