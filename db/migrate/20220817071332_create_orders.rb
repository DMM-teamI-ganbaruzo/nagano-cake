class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :shipping_post_code
      t.text :shipping_address
      t.string :shipping_address_name
      t.integer :shipping_charge
      t.integer :total_payment
      t.integer :payment_method
      t.integer :order_status

      t.timestamps
    end
  end
end
