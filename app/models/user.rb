class User < ApplicationRecord

	validates :email, uniqueness: true

	def auth_token
		JsonWebToken.encode(user_id: self.id)
	end
end
