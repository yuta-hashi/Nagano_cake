class Admin::GenresController < ApplicationController
  layout 'admin'
  
  def index
    @genre = Genre.new
    @genres = Genre.all
  end
  
  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to admin_genres_path
  end
  
  def edit
  end
  
  def update
  end
  
  # strong parameter
  private
  
  def genre_params
    params.require(:genre).permit(:id, :name)
  end
  
end
