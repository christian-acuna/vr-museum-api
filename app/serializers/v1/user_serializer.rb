module V1
	class UserSerializer < ActiveModel::Serializer
		attributes :email, :username, :id, :access_token
	end

end