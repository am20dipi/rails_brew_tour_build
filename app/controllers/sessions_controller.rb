class SessionsController < ApplicationController
    before_action :redirect_if_logged_in, only: [:new]

    def home 
    end

    def new 
       @user = User.new
    end 

    def create
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
        # if a user exists AND the user is authenticated via password
            session[:user_id] = @user.id

            redirect_to user_path(@user)
            # user_path(user) is the same as "/users/:id"
        else
            flash[:message] = "Sorry, please try again."
            redirect_to '/login'
        end
    end

    def omniauth
        user = User.from_omniauth(request.env['omniauth.auth'])
        if user.valid?
        # if a user exists AND the user is authenticated via password
            session[:user_id] = user.id

            redirect_to user_path(user)
            # user_path(user) is the same as "/users/:id"
        else
            flash[:message] = "Sorry, please try again."
            redirect_to '/login'
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end
end
