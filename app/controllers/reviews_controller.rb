class ReviewsController < ApplicationController
    
    def create
        review = Review.create(review_params)
    end 

    private

    def review_params
        params.require(:review).permit(:content, :rating, :user_id, :movie_id)
    end 
end

