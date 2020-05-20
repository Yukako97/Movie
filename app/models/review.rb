class Review < ApplicationRecord
def create
    @review = Review.new(review_params)
    @review.save
    redirect_to movie_path(@review.movie)
end

  private
    def review_params
      params.require(:review).permit(:movie_id, :body)
    end
end
