class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @items = Item.all
    @genre = Genre.find(params[:id])
    @genre_items = Item.find_by(genre_id: @genre.id)

  end

  def show
    @item = Item.find(params[:id])
    @price = (@item.tax_excluded_price.to_i * 1.1).round
    @cart_item = CartItem.new
  end
end
