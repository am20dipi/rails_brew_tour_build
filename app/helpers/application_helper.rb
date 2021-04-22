module ApplicationHelper
    def active_css(path) 
        "active" if current_page?(path)
    end

    def logged_in?
        !!session[:user_id]
    end


    def navigation_bar 
        if logged_in?
            render partial: 'layouts/logged_in'
        else
            render partial: 'layouts/logged_out'
        end
    end
end
