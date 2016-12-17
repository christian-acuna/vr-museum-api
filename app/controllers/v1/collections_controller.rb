module V1
	class CollectionsController < ApplicationController
		def index
			collections = Collection.all
			render json: collections, each_serializer: CollectionSerializer 
		end

	end

end