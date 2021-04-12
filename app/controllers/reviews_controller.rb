class ReviewsController < ApplicationController
    before_action :find_review, only: [:show, :edit, :update, :destroy]
    
    def index
        # how can I check if this is nested?
        if params[:beer_id] && @beer = Beer.find_by_id(params[:beer_id])
            # this means nested; if the url has .../:beer_id/...
            # AND if @beer is NIL then find the instance of beer by its id
            @reviews = @beer.reviews
        else
            @reviews = Review.all
        end
        # this ensures that the params are a true value; so one does not type "/beers/ruibnfouenofw/reviews" and retrieve results
    end

    def new
        @review = Review.new
    end

    def create 
        @review = Review.create(review_params)
        if @review.valid?
            redirect_to @beer 
        else
            render :new
        end
    end

    def edit
    end

    def update
        @review.update 
        if @review.save
            redirect_to @beer
        else
            render :edit
        end
    end

    def destroy 
        @review.destroy
        redirect_to @beer
    end

    private
    def find_review
        @review = Review.find_by(id: params[:id])
    end

    def review_params
        params.require(:review).permit(:title, :content, :rating)
    end
end
