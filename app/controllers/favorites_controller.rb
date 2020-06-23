class FavoritesController < ApplicationController
  def index
    @favorite_movies = current_user.favorite_movies
  end

  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.movie_id = params[:movie_id]
    favorite.save
    @movie = Movie.find_by(id: params[:movie_id])
  end
  
  def destroy
    user = current_user
    movie = Movie.find(params[:movie_id])
    if favorite = Favorite.find_by(user_id: user.id,movie_id:movie.id)
      favorite.delete
      @movie = Movie.find_by(id: params[:movie_id])
    end
  end
end
