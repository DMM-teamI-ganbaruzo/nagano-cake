class Public::ShippingAddressesController < ApplicationController

  def index
    # @shipping_address = ShippingAddress.new
    # @shipping_addresses = ShippingAddress.all
  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    @shipping_address.customer_id = current_customer.id
    @shipping_address.save
    redirect_to request.referer #同じページをリロードする
  end



  def edit
  end



  def update
  end

  def destroy
  end


  private

  def shipping_address_params
    params.require(:shipping_address).permit(:post_code, :address, :address_name)
  end


end
