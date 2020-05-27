class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @movie_id = params[:movie_id]
  end
  
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.movie_id = params[:review][:movie_id]
    if @review.save
      redirect_to movie_path
    end
  end

  private
    def review_params
      params.require(:review).permit(:movie_id, :body, :user_id)
    end
end
