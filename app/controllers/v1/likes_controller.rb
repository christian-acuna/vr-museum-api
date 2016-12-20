module V1
  class LikesController < ApplicationController
    skip_before_action :authenticate_user_from_token!
    
    def like
      user = User.find(params[:user_id])
      collection = Collection.find(params[:collection_id])

      like = collection.likes.where(user_id: params[:user_id]).first_or_create
      # count = like.count

       render json: collection.likes.count
       # , each_serializer: CompleteCollectionSerializer  
  end

  end
end