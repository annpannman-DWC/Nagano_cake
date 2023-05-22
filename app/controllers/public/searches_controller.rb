class Public::SearchesController < ApplicationController
  
  # before_action :authenticate_customer!
  
  def search_list
    @range = params[:range]
    @search = params[:search]
    @word = params[:word]
    if @range == "Genre"
      @genres = Genre.search_for(@search, @word)
    else 
      @items = Item.search_for(@search, @word)
    end 
  end 
  
end
