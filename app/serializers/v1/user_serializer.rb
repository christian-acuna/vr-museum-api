module V1
	class UserSerializer < ActiveModel::Serializer
		attributes :email, :username, :id
	end

end