class UserSplash < ActiveRecord::Base
		belongs_to :user
		belongs_to :splash
	  	validates_uniqueness_of :splash_id, :scope => :user_id
	  	validates_presence_of :user
	  	validates_presence_of :splash
	  	before_save :update_user_record

	  	def update_user_record
	  		if self.favorited_changed?
	  			user = Splash.find(self.splash_id).author
	  			if self.favorited == true
	  				user.score += 1
	  			else
	  				user.score -= 1
	  			end
	  			user.save
	  		end
	  	end
end
