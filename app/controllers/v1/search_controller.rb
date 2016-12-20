module V1
  class SearchController < ApplicationController
  	skip_before_action :authenticate_user_from_token!

    def search
      query = params[:q]

      if query.blank?
        render status: 400, json: { error: 'Expected parameter `query` '}
      else
          results_collection = Collection.where(["title LIKE ?", "%#{query}%"])
          render json: results_collection, each_serializer: CollectionSerializer
      end
    end

    def artsearch
      query = params[:q]

      if query.blank?
        render status: 400, json: { error: 'Expected parameter `query` '}
      else
          results_art = ArtObject.where(["title LIKE ?", "%#{query}%"])
          render json: results_art, each_serializer: ArtObjectSerializer
      end
    end

  end
end
