class Admin::OrdersController < ApplicationController
  def index
    @orders =Order.all
    @order =Order.new
    #@user =current_user
  end

  def show
    @order =Order.find(params[:id])
    #@user =current_user
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
     flash[:notice] = "You have updated book successfully."
     redirect_to admin_order_path(@order.id)
    else
     render :edit
    end
  end

private
  def order_params
    params.require(:order).permit(:customer_id, :shipping_post_code, :shipping_address, :shipping_address_name, :shipping_charge, :total_payment, :payment_method, :order_status)
  end

end
