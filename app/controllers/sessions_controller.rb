class SessionsController < ApplicationController
    before_action :redirect_if_logged_in, only: [:new]

    def home 
    end

    def new 
       @user = User.new
    end 

    def create
        user = User.find_by(email: params[:user][:email])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id

            redirect_to user_path(user)
        else
            flash[:message] = "Sorry, please try again."
            render :new
        end
    end

    def omniauth
        user = User.from_omniauth(request.env['omniauth.auth'])
        if user.valid?
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:message] = "Sorry, please try again."
            redirect_to '/login'
        end
    end

    def destroy
        session.clear
        redirect_to root_path, notice: "Logged out"
    end
end
