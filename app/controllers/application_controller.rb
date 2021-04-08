class ApplicationController < ActionController::Base
    helper_method :logged_in?
    # gives us access to these methods in the views

    def logged_in?
        !!session[:user_id]
    end

    def redirect_if_not_logged_in
        redirect_to '/login' if !logged_in?
    end
end
