class Public::SearchesController < ApplicationController

  # before_action :authenticate_customer!

  def search_list
    @range = params[:range]
    @search = params[:search]
    @word = params[:word]
    if @range == "Genre"
      genre = Genre.search_for(@search, @word)
      @genres = Item.where(genre_id: genre.ids,)
    else
      @items = Item.search_for(@search, @word)
    end
  end

end
