class MoviesController < ApplicationController
  def index
    @movie = Movie.all
  end
  
  def show
    @movie = Movie.find(params[:id])
    @reviews = @movie.reviews
  end
  
  def edit
    @movie = Movie.find(params[:id])
  end
  
  def update
    @movie = Movie.find(params[:id])
    @movie.update(movie_params)
    if @movie.update(movie_params)
      flash[:sucsess] = '編集が完了しました'
      render :show
    else
      flash.now[:danger] = '編集に失敗しました'
      render :edit
    end
  end
  
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
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
