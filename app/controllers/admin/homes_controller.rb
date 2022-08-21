class Admin::HomesController < ApplicationController
  def top
    @orders =Order.page(params[:page])
    #@user =current_user
  end
end
