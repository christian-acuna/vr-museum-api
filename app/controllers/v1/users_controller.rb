module V1
  class UsersController < ApplicationController
    skip_before_action :authenticate_user_from_token!

    def show
      user = User.find(params[:id])
      render json: user, serializer: UserSerializer
    end

    def create
      user = User.new(user_params)

      if user.save
        render json: user, serializer: UserSerializer
      else
        render( status: 400 )
      end
    end

    def update
      user = User.find(params[:id])
      
      if user.update(user_params)
        render json: user, serializer: UserSerializer
      else
        render( status: 400 )
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :username)
    end
  end
end