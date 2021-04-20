module ApplicationHelper
    def active_css(path) 
        "active" if current_page?(path) && logged_in?
    end

    def logged_in?
        !!session[:user_id]
    end
end
