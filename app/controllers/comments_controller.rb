class CommentsController < ApplicationController
	before_filter :set_headers
	before_action :authenticate
	
	def index
		comments = []
		Splash.find(params[:splash_id]).splash_comments.each do |comment|
			puts comment.user
			comments << {commentInfo: comment, userInfo: comment.user, id: comment.id}
		end
		render json: comments
	end

	def destroy
		SplashComment.destroy(params[:id])
	end

	def create
		commentInfo = SplashComment.create(:splash_id => params[:splash_id], :user_id => @current_user.id, :content => params[:content])
		render json: {commentInfo: commentInfo, userInfo: @current_user, id: commentInfo.id}
	end

end
