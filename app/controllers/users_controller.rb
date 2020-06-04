class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user
            session[:user_id] = @user.id 
            render 'show'
        else
            render 'new'
        end
    end

    def show
        @user = User.find(params[:id])
    end 


    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end
