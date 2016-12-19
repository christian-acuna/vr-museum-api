module V1
  class SearchController < ApplicationController
  	skip_before_action :authenticate_user_from_token!
    
    def search
      query = params[:q]

      if query.blank?
      render status: 400, json: { error: 'Expected parameter `q` '}
    else
      render(
        status: 200,
        json: results_collection = Collection.where(["title LIKE ?", "%#{query}%"]),
        json: results_art_objects = ArtObject.where(["title LIKE ?", "%#{query}%"])
      )
    end
    end

  end
end