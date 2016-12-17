module V1
	class ArtObjectSerializer < ActiveModel::Serializer
		attributes :title, :description, :image_url, :thumbnail_url, :museum, :medium
		# has_one :museum, serializer: V1::MuseumSerializer
		# has_one :medium, serializer: V1::MediumSerializer
	end

end