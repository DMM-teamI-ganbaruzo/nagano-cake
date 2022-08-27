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
         @order.shipping_post_code = ShippingAddress.find(params[:order][:registered]).post_code
         @order.shipping_address_name = ShippingAddress.find(params[:order][:registered]).address_name
         @order.shipping_address = ShippingAddress.find(params[:order][:registered]).address
    elsif params[:order][:address_number] == "3"
    else
       redirect_to orders_check_path
    end
     @cart_items = current_customer.cart_items.all
     @order.shipping_charge = 800
     @total = 0
  end

  def finish
  end

  def create
      cart_items = current_customer.cart_items.all
# ログインユーザーのカートアイテムをすべて取り出して cart_items に入れます
  @order = current_customer.orders.new(order_params)
# 渡ってきた値を @order に入れます
  if @order.save!
# ここに至るまでの間にチェックは済ませていますが、念の為IF文で分岐させています
    cart_items.each do |cart|
# 取り出したカートアイテムの数繰り返します
# order_item にも一緒にデータを保存する必要があるのでここで保存します
      order_detail = OrderDetail.new
      order_detail.item_id = cart.item_id
      order_detail.order_id = @order.id
      order_detail.quantity = cart.quantity
# 購入が完了したらカート情報は削除するのでこちらに保存します
      order_detail.purchase_price = cart.item.tax_excluded_price
# カート情報を削除するので item との紐付けが切れる前に保存します
      order_detail.save
    end
    redirect_to orders_finish_path
    cart_items.destroy_all
# ユーザーに関連するカートのデータ(購入したデータ)をすべて削除します(カートを空にする)
  else
    @order = Order.new(order_params)
    render :new
  end
  end

  def index
    @customer = current_customer
    @orders = @customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :shipping_post_code, :shipping_address, :shipping_address_name, :total_payment, :shipping_charge)
  end
end
