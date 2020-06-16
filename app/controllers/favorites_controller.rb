class FavoritesController < ApplicationController
  def index
    @favorite_movies = current_user.favorite_movies
  end

  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.movie_id = params[:movie_id]

    if favorite.save
      redirect_back fallback_location: movies_path, success: 'お気に入りに登録しました'
    else
      redirect_to movies_path, danger: 'お気に入りの登録に失敗しました'
    end
  end
  
  def destroy
    user = current_user
    movie = Movie.find(params[:movie_id])
    if favorite = Favorite.find_by(user_id: user.id,movie_id:movie.id)
      favorite.delete
      redirect_back fallback_location: movies_path, success: 'お気に入りから削除しました'
    else
      redirect_to movies_path
    end
  end
end
