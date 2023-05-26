class Admin::GenresController < ApplicationController

  def index
    @genres = Genre.all
    @genre_new = Genre.new
    # @genre = Genre.find(params[:id])
  end

  def create
    @genre_new = Genre.new(genre_params)
    @genre_new.save
    redirect_to admin_genres_path
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path
    else
      render "edit"
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to admin_genres_path
  end

  def search
    # 検索条件を取得
    search_word = params[:word]
    search_range = params[:range]
    search_type = params[:search]

    # 検索処理
    @genres = Genre.search(search_word, search_range, search_type)
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
