class Public::GenresController < ApplicationController
  def show
    @genres = Genre.page(params[:page]).per(8)
    @genre = Genre.find(params[:id])
  end
end
