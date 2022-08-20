class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  has_many :cart_items, dependent: :destroy


  def with_tax_price
    (tax_excluded_price * 1.1).floor
  end


  # has_many :orders,　dependent: :destroy
end
