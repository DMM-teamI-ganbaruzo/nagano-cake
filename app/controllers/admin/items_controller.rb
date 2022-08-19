class Admin::ItemsController < ApplicationController

  def index
    @items =Item.all
    @item =Item.new
    #@user =current_user
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    #@item.user_id = current_user.id
    #@user =current_user
    @items =Item.all
    if @item.save
     flash[:notice] = "You have created book successfully."
     redirect_to admin_item_path(@item.id)
    else
     render :index
    end
  end

  def show
    @item =Item.find(params[:id])
    #@user =current_user
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
     flash[:notice] = "You have updated book successfully."
     redirect_to admin_item_path(@item.id)
    else
     render :edit
    end
  end

end

private
  def item_params
    params.require(:item).permit(:genre_id, :name, :description, :tax_excluded_price, :sales_status)
  end

  #def correct_user
    #@item = Item.find(params[:id])
    #@user = @item.user
    #redirect_to(admin_item_path) unless @user == current_user
  #end

