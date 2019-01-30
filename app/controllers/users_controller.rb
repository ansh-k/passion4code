class UsersController < ApplicationController

	def signup
		user = User.create(user_params)
		if user.valid?
    	render json: {
        	message: "signup successful!", token: user.auth_token }, status: :ok
    else
    	render json: {
        message: user.errors.full_messages.join("")}, status: 403
    end 
	end

  def login
    auth_object = Authentication.new(login_params)
    if auth_object.authenticate
      render json: {
        message: "Login successful!", token: auth_object.generate_token }, status: :ok
    else
      render json: {
        message: "Incorrect email/password combination"}, status: :unauthorized
    end
  end

  private

  def user_params
  	params.permit(:email, :password, :name)
  end

  def login_params
    params.permit(:email, :password)
  end
end