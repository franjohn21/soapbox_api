class Splash < ActiveRecord::Base
		reverse_geocoded_by :latitude, :longitude
		belongs_to :author, :class_name => 'User'
		has_many :splash_comments

		has_many :user_splashes
		has_many :users, :through => :user_splashes
		before_save :inherit_from_author

		after_save :scan_for_nearby_users
		validates :content, presence: true, length: {maximum: 255}, allow_blank: false

		validates :content, presence: true, length: {maximum: 255}, allow_blank: false
	  	validates_presence_of :author

	private

		def inherit_from_author
		 	if self.author
		 		self.latitude = self.author.latitude
		 		self.longitude = self.author.longitude
		 	end
		end

		def scan_for_nearby_users
			@radius_setting_in_meters = 1000
			User.near([self.latitude, self.longitude], @radius_setting_in_meters / 1000.0, :units => :km).each  do |user|
				distance_in_meters = (user.distance_to(self, :km)*1000).round(2)
				UserSplash.create(:user_id => user.id, :splash_id => self.id, :distance_in_meters => distance_in_meters, :user_latitude => user.latitude, :user_longitude => user.longitude)
			end
		end

end
