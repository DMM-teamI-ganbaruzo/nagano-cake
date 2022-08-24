class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy


  def with_tax_price
    (tax_excluded_price * 1.1).floor
  end

  def self.looks(search, word)
    @item = Item.where("name LIKE?","%#{word}%")
  end


  # has_many :orders,　dependent: :destroy
end
