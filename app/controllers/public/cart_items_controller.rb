class Public::CartItemsController < ApplicationController
  def index
  end

  def update
  end

  def destroy
  end

  def reset
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    #@item.user_id = current_user.id
    #@user =current_user
    if @cart_item.save
     flash[:notice] = "カートに商品が入りました。"
     redirect_to  cart_items_path
    end
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:quantity, :item_id, :customer_id)
  end

end
