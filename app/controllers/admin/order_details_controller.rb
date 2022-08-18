class Admin::OrderDetailsController < ApplicationController

  def update
    @orderdetail = OrderDetail.find(params[:id])
    if @orderdetail.update(orderdetail_params)
     flash[:notice] = "You have updated order successfully."
     redirect_to admin_order_detail_path(@orderdetail.id)
    else
     render :updatea
    end
  end

end
