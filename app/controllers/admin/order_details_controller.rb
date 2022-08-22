class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.update(order_detail_params)
      redirect_to admin_order_path(@order_detail.order_id)
    else
      render :edit
    end

    # @order_detail = OrderDetail.find(params[:id])
    # if @order_detail.update(order_detail_params)
    # flash[:notice] = "You have updated book successfully."
    # redirect_to admin_order_detail_path(@order_detail.id)
    # else
    # render :edit
    # end
  end

private
  def order_detail_params
    # params.require(:item).permit(:order_id, :item_id, :purchase_price, :quantity, :production_status)
    params.require(:order_detail).permit(:production_status)
  end

end
