class UsersController < ApplicationController
    def create
      new_user = User.create!(user_params)
        render json: new_user, status: :created
    end

    def login
        found_user = User.find_by(username: params[:username])
        if found_user&.authenticate(params[:password])
            session[:uid] = found_user.id
            render json: {message: "Logged in successfully"}, status: :ok
        else
            render json: {message: "Invalid username or password"}, status: :unauthorized
        end
    end

    def logout
        session.delete :uid
        render json: {message: "Logged out successfully"}, status: :ok
    end

    def check_logged_in
        if session.include? :uid
            render json: user, status: :ok
        else
            render json: {message: "You are not logged in"}, status: :unauthorized
        end
    end



    private
    def user_params
        params.permit(:username, :password, :email, :profile_image)
    end


end
