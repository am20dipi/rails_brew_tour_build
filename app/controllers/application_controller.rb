class ApplicationController < ActionController::Base
    helper_method :logged_in?
    # gives us access to these methods in the views

    def logged_in?
        !!session[:user_id]
    end

    def redirect_if_not_logged_in
        redirect_to '/login' if !logged_in?
    end

    def current_user 
        @user ||= User.find_by(id: session[:user_id]) if logged_in?
        # if @current_user is already defined, it will equal @current_user.
        # otherwise it will find a @current_user by searching through the sessions hash
        # MEMOIZATION
    end
end
