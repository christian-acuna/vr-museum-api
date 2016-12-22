module V1
  class UserCollectionsController < ApplicationController
    skip_before_action :authenticate_user_from_token!, only: [:index, :show]
    def index
      user = User.find(params[:user_id])
      art_object_id = params[:art_object]
      collections = user.collections
      if params[:title] && art_object_id
        art_object = ArtObject.find(art_object_id)

        filtered_collections = collections.select do |collection|
          !collection.art_objects.include?(art_object)
        end
        titles=filtered_collections.pluck(:title,:id)
        render json: titles
      elsif params[:vr_mode]
        render json: collections, each_serializer: CompleteCollectionSerializer
      else
        render json: collections, each_serializer: CollectionSerializer
      end
    end

    def show
      user = User.find(params[:user_id])
      collections = user.collections.where(id: params[:collection_id])
      render json: collections, each_serializer: CompleteCollectionSerializer
    end

    def create
      user = User.find(params[:user_id])
      collection = user.collections.new(collection_params)
      # collection = Collection.new(collection_params)

      if collection.save
        render json: collection, each_serializer: CompleteCollectionSerializer
      else
        render( status: 200 )
      end
    end

    def update
      # user = User.find(params[:user_id])
      collection = Collection.find(params[:collection_id])

      if collection.update(collection_params)
        render json: collection, each_serializer: CompleteCollectionSerializer
      else
        render( status: 200 )
      end
    end

    def destroy
      # user = User /.find(params[:user_id])
      collection = Collection.find(params[:collection_id])

      if collection.destroy
        render( status: 200 )
      else
        render( status: 404 )
      end
    end

    private

    def collection_params
      params.require(:user_collection).permit(:title, :description, :primary_object_id, :user_id)
    end
  end
end
