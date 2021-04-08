class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            @user.save
            # log them in, since they are now signed up
            session[:user_id] = @user.id

            #redirect to the show page, "@user" is an abstraction of the user_path
            redirect_to @user 
        else
            render :new
        end

    end

    def show
        @user = User.find_by_id(params[:id])
        # what is the difference between "find_by_id" & "find"?
        # "find" will portray an error if a user is not found; "find_by_id" will return NIL"
        redirect_to '/' if !@user
        # protection: redirect to home page is user is not found/does not exist
    end



    private
        def user_params
            params.require(:user).permit(:name, :email, :password)
        end

end