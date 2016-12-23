module V1
	class CollectionsController < ApplicationController
		skip_before_action :authenticate_user_from_token!
		def index
			collections = Collection.all
			if params[:vr_mode]
        render json: collections, each_serializer: CompleteCollectionSerializer
			else
				render json: collections, each_serializer: CollectionSerializer
			end
		end

	end
end
