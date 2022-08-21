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
  end
end
