class ApplicationController < ActionController::API
	before_filter :set_headers
	def preflight
		headers["X-FRAME-OPTIONS"] = "ALLOWALL"
		headers['Access-Control-Allow-Origin'] = '*'
		headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
		headers['Access-Control-Request-Method'] = '*'
		headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'	
	end

	private
	def set_headers
		headers["X-FRAME-OPTIONS"] = "ALLOWALL"
		headers['Access-Control-Allow-Origin'] = '*'
		headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
		headers['Access-Control-Request-Method'] = '*'
		headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'	
	end


	def authenticate
		auth = Auth.find_by(access_token: request.headers['HTTP_AUTHORIZATION'])
		if auth
			if (Time.now - auth.created_at < 11000)
				@current_user = User.find(auth.user_id)
				# User In Session
				@current_user.latitude = params[:latitude].to_f if params[:latitude]
				@current_user.longitude = params[:longitude].to_f if params[:longitude]
				@current_user.save
				return true
			else
				# Session Time Out
				auth.destroy!
				head status: 408
				return false
			end
		else
			# Not found
			head status: 404
			return false
		end
	end

	def clear_session
		auth = Auth.find_by(access_token: request.headers["HTTP_ACCESS_TOKEN"])
		if auth
		auth.destroy!
		end
	end
end
