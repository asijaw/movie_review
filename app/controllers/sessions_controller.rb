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

    def oauth 
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.username = auth['info']['name']
            u.email = auth['info']['email']
            u.image = auth['info']['image']
          end
        
        session[:user_id] = @user.id
        redirect_to @user
    end 

    def destroy 
        session.clear
        redirect_to root_path
    end 

    private
    
    def auth
        request.env['omniauth.auth']
    end
end 