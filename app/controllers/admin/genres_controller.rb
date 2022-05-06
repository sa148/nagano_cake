class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.name = Genre.name
    @genre.save
    redirect_to admin_genres_path
  end

  def edit
    @genre = Genre.find(params[:id])
    @admin_genre = Admin_genre.id
    redirect_to admin_genres_path
  end

  def update
    @genre.update(book_params)
    redirect_to admin_genres_path
  end

  private

  def genre_params
    params.permit(:genre, :name)
  end

end
