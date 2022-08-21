class Public::OrdersController < ApplicationController
  def new
  end

  def check
  end

  def finish
  end

  def create
  end

  def index
    @customer = current_customer
    @orders = @customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
  end
end
