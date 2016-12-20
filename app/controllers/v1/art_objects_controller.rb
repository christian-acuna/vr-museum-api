module V1
  class ArtObjectsController < ApplicationController
  	skip_before_action :authenticate_user_from_token!

    def index
      art_objects = ArtObject.all
      # collections = user.collections
      render json: art_objects, each_serializer: ArtObjectSerializer
    end

    def show
      art_object = ArtObject.find(params[:id])
      # collections = user.collections.where(id: params[:collection_id])
      render json: art_object, each_serializer: ArtObjectSerializer
    end
  end
end
