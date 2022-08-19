class Public::HomesController < ApplicationController
  def top
    # @item = Item.find(params[:id])
    @item = Item.order('id DESC').limit(4)
    @items = Item.all
  end
  
  def about
  end
end
