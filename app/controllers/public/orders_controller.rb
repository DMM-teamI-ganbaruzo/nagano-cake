class Public::OrdersController < ApplicationController
  
  before_action :authenticate_customer!
  
  def new
    @customer = current_customer
    @order = Order.new  #(order_params)
    # @customer = Customer.find(params[:id])
    @shipping_addresses = @customer.shipping_addresses
    
  end

  def check
    @order = Order.new(order_params)
    if params[:order][:address_number] == "1"
      @order.shipping_address_name = current_customer.family_name + current_customer.first_name
      @order.shipping_address = current_customer.address
      @order.shipping_post_code = current_customer.post_code
    elsif params[:order][:address_number] == "2"
      # if ShippingAddress.exists?(address_name: params[:order][:registered])
         @order.shipping_address_name = ShippingAddress.find(params[:order][:registered]).name
         @order.shipping_address = ShippingAddress.find(params[:order][:registered]).address
      # else
      #   render :new
      # end
    elsif params[:order][:address_number] == "3"
      # address_new = current_customer.addresses.new(address_params)
      # if address_new.save
      # else
      #   render :new
      # end
     else
       redirect_to orders_check_path
     end
     @cart_items = current_customer.cart_items.all
     @total = @cart_items.inject(0) { |sum, item| sum + item.sum_price }
    # @order.postal_code = current_customer.postal_code
    # @order.address = current_customer.address
    # @order.name = current_customer.first_name + current_customer.last_name
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
  
  # def address_params
  #   params.require(:order).permit(:name, :address)
  # end
  
  def order_params
    params.require(:order).permit(:payment_method, :shipping_post_code, :shipping_address, :shipping_address_name,:customer_id)
  end
end
