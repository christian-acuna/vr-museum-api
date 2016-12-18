module V1
	class CollectionsController < ApplicationController
		def index
			collections = Collection.all
			render json: collections, each_serializer: CollectionSerializer
		end

		def search
		  query = params[:q]

			if query.blank?
      render status: 400, json: { error: 'Expected parameter `q` '}
    else
      render(
        status: 200,
        json: results = Collection.where(["title LIKE ?", "%#{query}%"])
      )
    end
		end

	end

end
