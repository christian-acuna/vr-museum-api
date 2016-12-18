module V1
  class UserCollectionsController < ApplicationController
    def index
      user = User.find(params[:user_id])
      collections = user.collections
      render json: collections, each_serializer: CollectionSerializer
    end

    def show
      user = User.find(params[:user_id])
      collections = user.collections.where(id: params[:collection_id])
      render json: collections, each_serializer: CompleteCollectionSerializer
    end
  end
end
