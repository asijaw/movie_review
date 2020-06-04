class MoviesController < ApplicationController
    def index
        @movies = Movie.all
    end
    
    def show
        @movie = Movie.find_by(id: params[:id])
        @reviews = @movie.reviews.build
    end

    def new
        @movie = Movie.new
        @book.reviews.build(params[:reviews_attr])
    end

    def create 
        @movie = Movie.create(movie_params)
        @user = current_user
        
        redirect_to movie_path(@movie)
    end
    
    private

    def movie_params
        params.require(:movie).permit(:title, :year, :genre, review_attr: [:content, :rating, :user_id, :movie_id])
    end 

end
