class ApplicationController < ActionController::Base
	protect_from_forgery with: :null_session
	include ExceptionHandler

	def authorize_user!
		auth_object = Authorization.new(request)
		unless auth_object.current_user
			return render json: {
        message: "Unauthorized"}, status: 401
		end
	end
end
