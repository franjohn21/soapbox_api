class UserController < ApplicationController
	before_filter :set_headers
	before_action :authenticate, :except => ['sessioning_user', 'clear_session']

	def sessioning_user
	  user = User.find_by(fb_id: params[:fb_id])
	  params[:profilePic] ||= Faker::Avatar.image 
	  if user
	    user.auth.destroy! if user.auth
	    user.update(
	    	first_name: params[:first_name], 
	    	last_name: params[:last_name], 
	    	age_range: params[:age_range], 
	    	gender: params[:gender], 
	    	email: params[:email], 
	    	profile_pic: params[:profilePic]
	    	)
	    newUser = false
	  else
	    user = User.new(
	    	first_name: params[:first_name], 
	    	last_name: params[:last_name], 
	    	gender: params[:gender], 
	    	age_range: params[:age_range], 
	    	email: params[:email], 
	    	profile_pic: params[:profilePic], 
	    	fb_id: params[:fb_id]
	    	)
	    newUser = true
	  end

	  if user.save
	  	Auth.create(user_id: user.id, access_token: request.headers['HTTP_AUTHORIZATION'], fb_id: params[:fb_id])
	  	render json: {user_id: user.id, newUser: newUser}
	  else
	  	render json: user.errors, status: :unprocessable_entity
	  end

	end

	def clear_session
		auth = Auth.find_by(access_token: request.headers["HTTP_ACCESS_TOKEN"])
		auth.destroy! if auth
	end

	def reach
		@radius_setting_in_meters = 1000
		render json: @current_user.nearbys(@radius_setting_in_meters / 1000, :units => :km).count(:all)
	end

end
