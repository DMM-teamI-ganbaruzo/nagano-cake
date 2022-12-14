class Public::ItemsController < ApplicationController

  def index
    @genres = Genre.all
    # @items = Item.all
    @items = Item.page(params[:page]).per(8)
    @itemall = Item.where(sales_status: 'true')
  end

  def show
    @item = Item.find(params[:id])
    @price = @item.with_tax_price
    @cart_item = CartItem.new
    @genres = Genre.all
  end

end
