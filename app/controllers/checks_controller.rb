class ChecksController < ApplicationController
  def index
    @check_movies = current_user.check_movies
  end

  def create
    check = Check.new
    check.user_id = current_user.id
    check.movie_id = params[:movie_id]
    check.save
    @movie = Movie.find_by(id: params[:movie_id])
  end
  
  def destroy
    user = current_user
    movie = Movie.find(params[:movie_id])
    if check = Check.find_by(user_id: user.id,movie_id:movie.id)
      check.delete
      @movie = Movie.find_by(id: params[:movie_id])
    end
  end
end

