class Public::ItemsController < ApplicationController
  def index
  end

  def show
    @item = Item.find(params[:id])
    @price = (@item.tax_excluded_price.to_i * 1.1).round
    @cart_item = CartItem.new
  end
end
