class ReviewsController < ApplicationController
    before_action :find_review, only: [:show, :edit, :update, :destroy]
    before_action :logged_in?, only: [:new, :create, :update, :destroy]
    
    def index
        redirect_if_not_logged_in
        # how can I check if this is nested?
        if params[:beer_id] && @beer = Beer.find(params[:beer_id])
            @reviews = @beer.reviews
        else
            @reviews = current_user.reviews.newest_to_oldest
        end
    end

    def show 
    end



    def new
        if params[:beer_id] && @beer = Beer.find_by_id(params[:beer_id])
            @review = @beer.reviews.build 
        else
            @review = Review.new
        end
    end

    def create 
        @review = current_user.reviews.build(review_params)
        if @review.save
            # 
            redirect_to @review 
        else
            render :new
        end
    end



    def edit
    end

    def update
        @review.update(review_params) 
        # 
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
        params.require(:review).permit(:title, :content, :rating, :beer_id)
    end
end
