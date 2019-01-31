class Authorization

	def initialize(request)
		@token = request.headers['Authorization']
  end

  def current_user
    if payload 
      User.find_by(id: payload['user_id'])
    else
      return false
    end
  end

  # Deconstructs the Authorization header and decodes the JWT token.
  def payload
    token = @token.split(' ').last
    JsonWebToken.decode(token)
  rescue
    nil
  end
end