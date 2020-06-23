class WishesController < ApplicationController
  def index
    @wish_movies = current_user.wish_movies
  end

  def create
    wish = Wish.new
    wish.user_id = current_user.id
    wish.movie_id = params[:movie_id]
    wish.save
    @movie = Movie.find_by(id: params[:movie_id])
  end
  
  def destroy
    user = current_user
    movie = Movie.find(params[:movie_id])
    if wish = Wish.find_by(user_id: user.id,movie_id:movie.id)
      wish.delete
      @movie = Movie.find_by(id: params[:movie_id])
    end
  end
end
