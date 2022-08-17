class CreateShippingAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :shipping_addresses do |t|
      t.integer :customer_id
      t.string :post_code
      t.text :address
      t.string :address_name
      t.datetime :created_at
      t.datetime :updated_at
      t.timestamps
    end
  end
end
