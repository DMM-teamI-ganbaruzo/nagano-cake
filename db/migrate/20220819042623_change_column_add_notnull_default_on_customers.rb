class ChangeColumnAddNotnullDefaultOnCustomers < ActiveRecord::Migration[6.1]
  def change
    change_column_null :customers, :family_name, false
    change_column_null :customers, :first_name, false
    change_column_null :customers, :family_name_kana, false
    change_column_null :customers, :first_name_kana, false
    change_column_null :customers, :post_code, false
    change_column_null :customers, :address, false
    change_column_null :customers, :phone_number, false
    change_column_null :customers, :delete_status, false
  end

  def up
    change_column :customers, :delete_status, :boolean, default: false
  end

end
