module V1
  class FavoritesController < ApplicationController
    skip_before_action :authenticate_user_from_token!
    
    def index
      favorites = Favorite.all
      render json: favorites, each_serializer: FavoriteSerializer
    end

    def create
      user = User.find(params[:user_id])
      collection = Collection.find(params[:collection_id])
  
      favorite = collection.favorites.where(user_id: params[:user_id]).new

      unless user.favorites.exists?(collection_id: params[:collection_id])

        favorite.save  
        
        render json: favorite, each_serializer: FavoriteSerializer
      else
        render( status: 200 )
      end

    end

    def destroy
      user = User.find(params[:user_id])
      collection = Collection.find(params[:collection_id])

      favorite = user.favorites.where(collection_id: params[:collection_id]).first
      if favorite.destroy
        render( status: 200 )
      else
        render( status: 400 )
      end

    end

  end
end