class User < ApplicationRecord

  validates :email, uniqueness: true
  has_secure_password

	def auth_token
		JsonWebToken.encode(user_id: self.id)
	end
end
