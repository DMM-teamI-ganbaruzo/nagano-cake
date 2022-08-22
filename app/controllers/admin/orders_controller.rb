class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
    #@user =current_user
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_status_params)
     redirect_to admin_order_path(@order.id)
    else
     render :edit
    end
  end

private
  def order_status_params
    params.require(:order).permit(:order_status)
    # params.require(:order).permit(:customer_id, :shipping_post_code, :shipping_address, :shipping_address_name, :shipping_charge, :total_payment, :payment_method, :order_status)
  end

end
