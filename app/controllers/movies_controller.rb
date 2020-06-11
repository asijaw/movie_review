class MoviesController < ApplicationController
    def index
        @movies = Movie.all
    end
    
    def show
        @movie = Movie.find_by(id: params[:id])
        @reviews = @movie.reviews
    end

    def new
        if logged_in?
            @movie = Movie.new
            @review = @movie.reviews.build
        else
            redirect_to login_path
        end 
    end

    def create 
        @movie = Movie.new(movie_params)
        
        @user = current_user
        if @movie.save
            redirect_to movie_path(@movie)
        else
            render 'new'
        end
    end
    
    private

    def movie_params
        params.require(:movie).permit(:title, :year, :genre, reviews_attributes: [:content, :rating, :user_id, :movie_id])
    end 

end
