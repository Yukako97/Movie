class WishesController < ApplicationController
  def index
    @wish_movies = current_user.wish_movies
  end

  def create
    wish = Wish.new
    wish.user_id = current_user.id
    wish.movie_id = params[:movie_id]

    if wish.save
      redirect_back fallback_location: movies_path, success: 'Wishリストに登録しました'
    else
      redirect_to movies_path, danger: 'Wishリストの登録に失敗しました'
    end
  end
  
  def destroy
    user = current_user
    movie = Movie.find(params[:movie_id])
    if wish = Wish.find_by(user_id: user.id,movie_id:movie.id)
      wish.delete
      redirect_back fallback_location: movies_path, success: 'お気に入りから削除しました'
    else
      redirect_to movies_path
    end
  end
end
