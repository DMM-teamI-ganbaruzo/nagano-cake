class ShippingAddress < ApplicationRecord
  belongs_to :customer
    # validate :post_code
    # validate :address
    # validate :address_name
    
end
