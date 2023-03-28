class ReviewsController < ApplicationController
    def create
        review = user.reviews.create!(reviews_params)
        render json: review, status: :ok
    end

    def show
        review = Review.find_by(id: params[:id])
        if review
            render json: review
        else
            render json: {error: "No such review"}, status: :not_found
        end
    end

    private
    def reviews_params
        params.permit(:title, :content, :book_id)
    end
end
