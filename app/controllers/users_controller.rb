class UsersController < ApplicationController
    
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to @user 
        else
            render :new
        end

    end


    def show
        if logged_in?
            @user = User.find_by_id(params[:id])
            @beers = @user.beers
        else
            redirect_to login_path
        end
    end

    



    private
        def user_params
            params.require(:user).permit(:name, :email, :password)
        end

end