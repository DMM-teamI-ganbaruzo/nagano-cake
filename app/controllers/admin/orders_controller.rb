class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
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
  end

end
