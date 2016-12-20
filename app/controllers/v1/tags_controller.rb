module V1
  class TagsController < ApplicationController
    skip_before_action :authenticate_user_from_token!
    
    # def index
    #   collection = Collection.find(params[:collection_id])

    #   tags = collection.tags
    #   render json: tags
    #   # , each_serializer: FavoriteSerializer
    # end

    def create
      collection = Collection.find(params[:collection_id])
      p collection
      p "8" * 25
      tag = collection.tags.new(name: params[:name])
      
      if tag.save
        p tag
        p tag.collections
        render json: tag
      else
        render(status 404)
      end
    end

    def destroy
      collection = Collection.find(params[:collection_id])
      tag = collection.tags.find(params[:tag_id])

      if tag.destroy
        render(status 200)
      else
        render(status 404)
      end
    end
  end
end