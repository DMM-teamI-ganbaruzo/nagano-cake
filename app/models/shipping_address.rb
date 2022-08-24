class ShippingAddress < ApplicationRecord
  belongs_to :customer
    # validate :post_code
    # validate :address
    # validate :address_name
    
  def address_display
  '〒' + post_code + ' ' + address + ' ' + address_name
  end
end
