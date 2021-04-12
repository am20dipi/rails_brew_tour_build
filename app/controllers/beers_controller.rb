class BeersController < ApplicationController
    before_action :find_beer, only: [:show, :edit, :update, :destroy]
  
    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @beers = @user.beers
        else  
            @error = "That user does not exist." if params[:user_id]
            @beers = Beer.all
        end
    end

    def show
    end
    
    
    
    def new 
       @beer = Beer.new 
       # .new instantiates a new AR model, without saving it to the db.
       @beer.reviews.build
       # .build instantiates, does not CREATE
    end

    def create 
        @beer = current_user.beers.build(beer_params)
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
        params.require(:beer).permit(:name, :abv, :description, :user_id, :brewery_id, :review_id, brewery_attributes: [], review_attributes: [])
    end
end
