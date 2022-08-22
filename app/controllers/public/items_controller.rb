class Public::ItemsController < ApplicationController

  def index
    @genres = Genre.all
    @items = Item.all

  end

  def show
    @item = Item.find(params[:id])
    @price = @item.with_tax_price
    @cart_item = CartItem.new
  end

end
