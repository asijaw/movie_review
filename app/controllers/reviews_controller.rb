class ReviewsController < ApplicationController
    
    def new 
        @review = Review.new
    end 

    def create
        @movie = Movie.find_by(params[:movie_id])
        @review = @movie.reviews.build(review_params)
        @review.user = current_user
        if @review.save
            redirect_to movie_reviews_path(@movie.id)
        else
            render 'new'
        end 
    end 

    def index
        if params[:movie_id]
            @reviews = Movie.find(params[:movie_id]).reviews
        elsif params[:user_id]
            @reviews = Movie.find(params[:user_id]).reviews
        else
            @reviews = Review.all
        end
    end
    
    def show
        @review = Review.find(params[:id])
        @movie = @review.movie
    end

    def destroy
        @review = current_user.reviews.find(params[:id])
        @review.destroy
        flash[:notice] = "Review deleted"
        redirect_to user_path(current_user)
      end

    private

    def review_params
        params.require(:review).permit(:content, :rating, :user_id, :movie_id)
    end 
end

