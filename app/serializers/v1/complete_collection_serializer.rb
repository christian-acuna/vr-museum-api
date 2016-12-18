module V1
	class CompleteCollectionSerializer < ActiveModel::Serializer
		attributes :title, :description, :primary_object, :id
		has_many :art_objects, serializer: V1::ArtObjectSerializer
		has_one :user, serializer: V1::UserSerializer
	end

end
