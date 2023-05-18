class Admin::GenresController < ApplicationController

  def index
    @genres = Genre.all
    @genre_new = Genre.new
    # @genre = Genre.find(params[:id])
  end

  def create
     @genre = Genres.new(genre_params)
  end

  def edit
  end

  def update
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
