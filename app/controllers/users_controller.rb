class UsersController < ApplicationController
    def create
        user = User.create(username: params[:email])
        if user
            render json: user
        else
            render json: {error: 'Invalid username or password.'}
        end
    end
end
