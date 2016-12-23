module V1
	class ArtObjectSerializer < ActiveModel::Serializer
		attributes :id, :title, :description, :image_url, :thumbnail_url, :museum, :medium, :place, :vr_url, :artist, :date, :link_to_object
		# has_one :museum, serializer: V1::MuseumSerializer
		# has_one :medium, serializer: V1::MediumSerializer
	end

end
