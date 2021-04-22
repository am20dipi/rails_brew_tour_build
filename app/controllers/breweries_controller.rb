class BreweriesController < ApplicationController
    before_action :find_brewery, only: [:show, :edit, :update, :destroy]
    before_action :logged_in?, only: [:new, :create, :update, :destroy]

    def index
        byebug
        if logged_in?
            @breweries = current_user.breweries.all
            render :'breweries/index'
        else
            redirect_if_not_logged_in
        end
    end
    
    def show 
    end
    
    
    
    
    
    def new
        @brewery = Brewery.new
        @brewery.beers.build
    end

    def create
        @brewery = current_user.breweries.build(brewery_params)
        if @brewery.valid?
            # .valid? returns T or F
            @brewery.save
            # .save inserts into db 
            redirect_to @brewery
        else
            render :new
        end
    end

    def edit
    end

    def update
        @brewery.update(brewery_params) 
        if @brewery.valid?
            @brewery.save
            redirect_to @brewery
        else
            render :edit
        end
    end

    def destroy
        @brewery.destroy 
        redirect_to breweries_path, :notice => "Successfully deleted."
    end

    private 

    def brewery_params
        params.require(:brewery).permit(:name, :location, :year_established, :beer_id, :user_id)
    end

    def find_brewery
        @brewery = Brewery.find_by(id: params[:id])
    end
end
