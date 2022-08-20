class Public::CartItemsController < ApplicationController

  def index
    @cart_items =CartItem.all
    #@user =current_user
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
     flash[:notice] = "You have updated book successfully."
     redirect_to admin_cart_item_path(@cart_item.id)
    else
     render :update
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

#resetは作業途中です。インスタンス変数などは暫定で置いています。
  def reset
    @reset = current_customer.cart_item.destroy_all
    redirect_to cart_items_path
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

private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :quantity)
  end

  #def correct_user
    #@item = Item.find(params[:id])
    #@user = @item.user
    #redirect_to(admin_item_path) unless @user == current_user
  #end
