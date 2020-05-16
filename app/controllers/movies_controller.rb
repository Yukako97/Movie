class MoviesController < ApplicationController
  def index
    @movie = Movie.all
  end
  
  def new
    @movie = Movie.new
  end
  
  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path, sucsess: '登録が完了しました'
    else
      flash.now[:danger] = '登録に失敗しました'
      render :new
    end
  end
  
  private
  def movie_params
    params.require(:movie).permit(:title, :image)
  end
end
