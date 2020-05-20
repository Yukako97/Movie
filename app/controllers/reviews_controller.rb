class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.save
    redirect_to movies_path
  end

  private
    def review_params
      params.require(:review).permit(:movie_id, :body)
    end
end
