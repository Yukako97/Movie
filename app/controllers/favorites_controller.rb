class FavoritesController < ApplicationController
  def index
    @favorite_movies = current_user.favorite_movies
  end

  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.movie_id = params[:movie_id]

    if favorite.save
      redirect_to movies_path, success: 'お気に入りに登録しました'
    else
      redirect_to movies_path, danger: 'お気に入りに登録に失敗しました'
    end
  end
end
