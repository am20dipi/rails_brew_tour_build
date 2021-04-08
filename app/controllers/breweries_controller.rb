class BreweriesController < ApplicationController
    before_action :find_brewery, only: [:show, :edit, :update, :destroy]
    
    def show 
    end
    
    
    def new
        @brewery = Brewery.new
    end

    def create
        @brewery = Brewery.create(brewery_params)
        if @brewery.valid?
            @brewery.save
            redirect_to @brewery
        else
            render :new
        end
    end

    def edit
    end

    def update
        @brewery.update(brewery_params(:name, :location, :year_established)) 
        if @brewery.valid?
            redirect_to @brewery
        else
            render :edit
        end
    end

    def destroy
        @brewery.destroy 
        redirect_to @beer, :notice => "Successfully deleted."
    end

    private 

    def brewery_params
        params.require(:brewery).permit(:name, :location, :year_established)
    end

    def find_brewery
        @brewery = Brewery.find_by(id: params[:id])
    end
end
