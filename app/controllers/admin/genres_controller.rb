class Admin::GenresController < ApplicationController

before_action :authenticate_admin!

  def index
    @genres =Genre.all
    @genre =Genre.new
    #@user =current_user
  end

  def create
    @genre = Genre.new(genre_params)
    #@item.user_id = current_user.id
    #@user =current_user
    @genres =Genre.all
    if @genre.save
     flash[:notice] = "You have created book successfully."
     redirect_to admin_genres_path
    else
     render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
     flash[:notice] = "You have updated book successfully."
     redirect_to admin_genres_path
    else
     render :edit
    end
  end

private
  def genre_params
    params.require(:genre).permit(:name)
  end

end