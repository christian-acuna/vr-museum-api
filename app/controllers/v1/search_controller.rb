module V1
  class SearchController < ApplicationController
  	skip_before_action :authenticate_user_from_token!

    def search
      query = params[:q]

      if query.blank?
        render status: 400, json: { error: 'Expected parameter `query` '}
      else
          results_collection = Collection.where(["title LIKE ?", "%#{query}%"])
          results_art_objects = ArtObject.where(["title LIKE ?", "%#{query}%"])
          render json: { collections: results_collection, art_objects: results_art_objects}, status: :ok
      end
    end


  end
end
