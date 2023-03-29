class ApplicationController < ActionController::API
    include ActionController::Cookies
# rescue_from ActiveRecord::StandardError, with: :standard_error_finder

    def user
        User.find(session[:uid])
    end

    private

    # def standard_error_finder
    #     render json: {errors: invalid.errors}, status: :400
    # end
end
