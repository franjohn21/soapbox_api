class User < ActiveRecord::Base
	reverse_geocoded_by :latitude, :longitude
	has_many :splashes_created, :class_name => 'Splash', :foreign_key => 'author_id'
	has_many :splash_comments

	has_many :user_splashes
	has_many :splashes, :through => :user_splashes

	validates :fb_id, presence: true
	has_one :auth
	after_create :add_defaults

	def add_defaults
		self.splashes << Splash.all.order(created_at: :desc).limit(20)
		self.save
	end

end
