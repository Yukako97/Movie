class ChecksController < ApplicationController
  def index
    @check_movies = current_user.check_movies
  end

  def create
    check = Check.new
    check.user_id = current_user.id
    check.movie_id = params[:movie_id]

    if check.save
      redirect_back fallback_location: movies_path, success: '登録しました'
    else
      redirect_to movies_path, danger: '登録に失敗しました'
    end
  end
  
  def destroy
    user = current_user
    movie = Movie.find(params[:movie_id])
    if check = Check.find_by(user_id: user.id,movie_id:movie.id)
      check.delete
      redirect_back fallback_location: movies_path, success: 'お気に入りから削除しました'
    else
      redirect_to movies_path
    end
  end
end

