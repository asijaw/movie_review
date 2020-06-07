class SessionsController < ApplicationController
    def new
        if logged_in?
            redirect_to user_path(current_user)
        else
            @user = User.new
        end
    end 

    def create
        @user = User.find_by(username: params[:session][:username])
        if @user && @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id 
            redirect_to @user
        else
            flash[:alert] = "Invalid entry, please try again"
            render 'new'
        end
    end 

    def destroy 
        session.clear
        redirect_to root_path
    end 
end 