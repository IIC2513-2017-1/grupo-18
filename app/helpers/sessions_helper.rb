module SessionsHelper

	# Logs in the user
	def log_in(user)
    @current_user = User.find_by(access_token: request.headers["Access-Token"]) if request.headers["Access-Token"].present?
		session[:user_id] = user.id unless @current_user.present?
	end

	def log_out
		session.delete(:user_id)
		@current_user = nil
	end

	def current_user
    return @current_user = User.find_by(access_token: request.headers["Access-Token"]) if request.headers["Access-Token"].present?
		@current_user ||= User.find_by(id: session[:user_id])
	end

	def logged_in?
		!current_user.nil?
	end
end
