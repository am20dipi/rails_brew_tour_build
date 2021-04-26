class ReviewsController < ApplicationController
    before_action :find_review, only: [:show, :edit, :update, :destroy]
    before_action :logged_in?, only: [:create, :update, :destroy]
    
    def index
        redirect_if_not_logged_in
        # how can I check if this is nested?
        if params[:beer_id] && @beer = Beer.find(params[:beer_id])
            # this means nested; if the url has .../:beer_id/...
            # AND if @beer is NIL then find the instance of beer by its id
            # Rails provides "params[:beer_id] through the nested route we created"
            @reviews = @beer.reviews
        else
            @error = "That beer does not exist." if params[:beer_id]
            @reviews = current_user.reviews.newest_to_oldest
        end
        # this ensures that the params are a true value; so one does not type "/beers/ruibnfouenofw/reviews" and retrieve results
        # it will go to the else if it is either not nested or nested and cannot find the :beer_id
    end

    def show 
    end



    def new
        # if it is nested and we find the beer
        if params[:beer_id] && @beer = Beer.find_by_id(params[:beer_id])
            @review = @beer.reviews.build 
        else
            @review = Review.new
            #form_builders require instance variables
        end
    end

    def create 
        @review = current_user.reviews.build(review_params)
        if @review.save
            # .save triggers model validations
            redirect_to @review 
        else
            render :new
        end
    end



    def edit
    end

    def update
        @review.update(review_params) 
        # .update triggers model validations
        if @review.save
            redirect_to @review
        else
            render :edit
        end
    end

    def destroy 
        @review.destroy
        redirect_to reviews_path
    end

    private
    def find_review
        @review = Review.find_by(id: params[:id])
    end

    def review_params
        params.require(:review).permit(:title, :content, :rating, :user_id, :beer_id)
    end
end
