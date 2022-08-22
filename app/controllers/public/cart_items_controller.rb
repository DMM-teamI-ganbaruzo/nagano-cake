class Public::CartItemsController < ApplicationController

  def index
    @order = Order.new
    @cart_items =CartItem.all
    @total = 0
    #@user =current_user
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
     flash[:notice] = "You have updated book successfully."
     redirect_to cart_items_path
    else
     render :cart_items_path
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def reset
    @reset = current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    cart_item_find_by = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    if cart_item_find_by.present?
      cart_item_find_by.quantity += params[:cart_item][:quantity].to_i
      cart_item_find_by.save
			flash[:notice] = "Item was successfully added to cart."
			redirect_to cart_items_path
    else
    @cart_item = CartItem.new(cart_item_params)
    #@item.user_id = current_user.id
    #@user =current_user
      if @cart_item.save
        flash[:notice] = "カートに商品が入りました。"
        redirect_to  cart_items_path
      else
        render cart_items_path
      end
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
