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

    def create
      collection = Collection.new(collection_params)

      if collection.save
        render json: collection, each_serializer: CompleteCollectionSerializer
      else
        render( status: 200 )
      end
    end

    def update
      if collection.update(collection_params)
        render json: collection, each_serializer: CompleteCollectionSerializer
      else
        render( status: 200 )
      end
    end

    def destroy
    end
  end
end
