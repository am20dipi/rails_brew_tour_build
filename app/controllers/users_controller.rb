class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.save
            # log them in, since they are now signed up
            session[:user_id] = @user.id

            #redirect to the show page, "@user" is an abstraction of the user_path
            redirect_to @user 
        else
            render :new
        end

    end

    def show
        @user = User.find_by(id: params[:id])
        @reviews = @user.reviews
      end



    private
    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end
