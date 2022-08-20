class Public::OrdersController < ApplicationController
  def new
    @order = Order.new  #(order_params)
    # @customer = Customer.find(params[:id])
    # @shipping_addresses = @customer.shipping_addresses
  end

  def check
    # @order = Order.new(order_params)
    # @order.postal_code = current_customer.postal_code
    # @order.address = current_customer.address
    # @order.name = current_customer.first_name + current_customer.last_name
  end

  def finish
  end

  def create
  end

  def index
  end

  def show
  end
  
  def address_params
    params.require(:order).permit(:name, :address)
  end
  
end
