class MoviesController < ApplicationController
    def index
        @movies = Movie.all
    end
    
    def show
        @movie = Movie.find_by(id: params[:id])
    end

    def new
        @movie = Movie.new
    end

    def create 
        @movie = Movie.create(movie_params)
        @user = current_user
        redirect_to movie_path(@movie)
    end
    
    private

    def movie_params
        params.require(:movie).permit(:title, :year, :genre)
    end 

end
