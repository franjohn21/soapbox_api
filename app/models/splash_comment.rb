class SplashComment < ActiveRecord::Base
	belongs_to :user
	belongs_to :splash

	validates :content, presence: true, length: {maximum: 255}, allow_blank: false

end

