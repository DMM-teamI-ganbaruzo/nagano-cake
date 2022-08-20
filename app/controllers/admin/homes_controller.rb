class Admin::HomesController < ApplicationController
  def top
    @orders =Order.all
    #@user =current_user
  end
end
