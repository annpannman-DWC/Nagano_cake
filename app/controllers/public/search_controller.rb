class Public::SearchController < ApplicationController
  def search
    @genre = Genre.find_by(name: params[:genre_name])
    @items = @genre.items if @genre
  end
  
end
