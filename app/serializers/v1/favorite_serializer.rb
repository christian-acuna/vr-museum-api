module V1
  class FavoriteSerializer < ActiveModel::Serializer
    attributes :user_id, :collection_id
    belongs_to :collection, serializer: V1::CompleteCollectionSerializer
    belongs_to :user
 
    # has_one :user, serializer: V1::UserSerializer
  end

end