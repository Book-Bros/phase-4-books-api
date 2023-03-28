class ReviewsController < ApplicationController
    def create
        review = user.reviews.create!(reviews_params)
        render json: review, status: :ok
    end

    private
    def reviews_params
        params.permit(:title, :content, :book_id)
    end
end
