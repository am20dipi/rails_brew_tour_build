class BeersController < ApplicationController
    before_action :find_beer, only: [:show, :edit, :update, :destroy]
    before_action :logged_in?, only: [:create, :update, :destroy]
    
    def index
        redirect_if_not_logged_in
        @beers = current_user.beers.alphabetical
        
    end

    def show
    end
    
    
    
    def new 
        if params[:brewery_id] && @brewery = Brewery.find(params[:brewery_id])
            @beer = @brewery.beers.build
        # .new instantiates a new AR model, without saving it to the db.
        # .build instantiates, does not CREATE
        else
            @beer = Beer.new
        end
      
    end

    def create 
        @beer = current_user.beers.build(beer_params)
        #byebug
        if @beer.save
            redirect_to @beer
        else
            render :new
        end
    end

    

    def edit
    end

    def update
        @beer.update(beer_params) 
        if @beer.save
            redirect_to @beer
        else
            render :edit
        end
    end

    def destroy
        @beer.destroy
        redirect_to beers_path, :notice => "Successfully deleted."
    end

    private
    def find_beer
        @beer = Beer.find_by(id: params[:id])
    end

    def beer_params
        params.require(:beer).permit(:name, :abv, :description, :brewery_id, :review_id, reviews_attributes: [:title, :content, :rating])
    end
end
