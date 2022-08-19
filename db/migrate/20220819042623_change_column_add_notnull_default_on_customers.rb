class ChangeColumnAddNotnullDefaultOnCustomers < ActiveRecord::Migration[6.1]
  def change
    change_column :customers, :family_name, :string, null: false
    change_column :customers, :first_name, :string, null: false
    change_column :customers, :family_name_kana, :string, null: false
    change_column :customers, :first_name_kana, :string, null: false
    change_column :customers, :post_code, :string, null: false
    change_column :customers, :address, :text, null: false
    change_column :customers, :phone_number, :string, null: false
    change_column :customers, :delete_status, :boolean, default: false, null: false
  end

end
