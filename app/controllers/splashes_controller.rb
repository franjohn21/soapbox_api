class SplashesController < ApplicationController
	before_filter :set_headers
	before_action :authenticate 

	def create
		@current_user.splashes_created << Splash.create(:content => params[:content])
		splash = @current_user.splashes_created.last
		render :json => {splashInfo: splash, userInfo: @current_user, userSplash: UserSplash.find_by(:user_id => @current_user.id, :splash_id => splash.id), reach: splash.user_splashes.count, score: 0, id: splash.id}
	end

	def show 
		splash = Splash.find(params[:id])
		user = User.find(splash.author_id)
		user_splash = UserSplash.find_by(:user_id => user.id, :splash_id => splash.id)
		render :json => {splashInfo: splash, userInfo: user, userSplash: user_splash, reach: splash.user_splashes.count, score: splash.user_splashes.where(:favorited => true).count, id: splash.id, comments: splash.splash_comments.count}
	end

	def toggle_favorite
		splash = Splash.find(params[:splash_id])
		usersplash = UserSplash.find_by(:splash_id => params[:splash_id], :user_id => @current_user.id)
		if usersplash
			usersplash.favorited = !usersplash.favorited  
			usersplash.save
		else
			UserSplash.create(:splash_id => params[:splash_id], :user_id => @current_user.id, :favorited => true)
		end
	end

	def index
		splashes = []
		@current_user.splashes.includes(:user_splashes, :author).find_each do |splash| 
			user_splash = splash.user_splashes.find_by(:user_id => @current_user.id)

			splashes << {splashInfo: splash, userInfo: splash.author, userSplash: user_splash, reach: splash.user_splashes.count, score: splash.user_splashes.where(:favorited => true).count, id: splash.id, comments: splash.splash_comments.count}

		end
		render :json => splashes
	end

	def destroy
		splash = Splash.find(params[:id])
		splash.destroy if(@current_user.id == splash.author_id)
	end
end
