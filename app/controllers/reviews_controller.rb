class ReviewsController < ApplicationController
    
    def new 
        @review = Review.new
    end 

    def create
        @movie = Movie.find(:movie_id)
        @review = @movie.reviews.build(review_params)
        @review.user = current_user
    end 

    private

    def review_params
        params.require(:review).permit(:content, :rating, :user_id, :movie_id)
    end 
end

