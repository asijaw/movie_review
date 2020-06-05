class ReviewsController < ApplicationController
    
    def new 
        @review = Review.new
    end 

    def create
        @movie = Movie.find(:movie_id)
        @review = @movie.reviews.build(review_params)
        @review.user = current_user
        if @review.save
            redirect_to @movie
        else
            render 'new'
        end 
    end 

    def index
        if params[:movie_id]
            @reviews = Movie.find(params[:movie_id]).reviews
        else
            @reviews = Review.all
        end
    end
    
    def show
        @review = Review.find(params[:id])
        @movie = @review.movie
    end

    private

    def review_params
        params.require(:review).permit(:content, :rating, :user_id, :movie_id)
    end 
end

