class Order < ApplicationRecord
  
belongs_to :Customer
belongs_to :items
has_many :order_details, dependent: :destroy

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: { waiting_payment: 0, confirmation_payment: 1, creating_production: 2, preparation_shipping: 3, finish_shipping: 4 }

  belongs_to :customer
  has_many :order_details, dependent: :destroy

end
