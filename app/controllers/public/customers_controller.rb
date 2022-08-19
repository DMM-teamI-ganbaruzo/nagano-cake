class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
    # if @customer.update(customer_params)
    #   redirect_to public_customer_path(@customer.id)
    # else
    #   render "edit"
    # end
  end

  def update
  end

  def check
  end

  def withdrawal
  end

  private

  # def customer_params
  #   params.require(:customer).permit(:title, :body)
  # end


end
