module V1
  class UserCollectionArtObjectsController < ApplicationController

    def create
      user = User.find(params[:user_id])
      p collection = user.collections.find(params[:collection_id])
      p art_object = ArtObject.find(params[:art_object_id])
      p new_art_object= CollectionArtObject.new(collection_id:collection.id,art_object_id:art_object.id)

      if new_art_object.save
        render( status: 200 )
      else
       render( status: 404 )
      end
    end

    def destroy
      user = User.find(params[:user_id])
      collection = user.collections.find(params[:collection_id])
      art_object = ArtObject.find(params[:art_object_id])

      delete_object = CollectionArtObject.where(collection_id:collection,art_object_id:art_object)
      if CollectionArtObject.delete(delete_object)
        render( status: 200 )
      else
        render( status: 404 )
      end
    end
  end
end
