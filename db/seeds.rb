10.times do |x|
    counter = Random.rand(0..0.1)
	user = User.create(:fb_id => Faker::Internet.user_name,
		:latitude => 37.756892 + counter,
		:longitude => -122.475571 + counter, :first_name => Faker::Name.first_name, :last_name => Faker::Name.last_name)
	5.times do |x|
    splash = Splash.create(:content => Faker::Lorem.sentence)
		user.splashes_created << splash
    5.times do |y|
      splash_comment = SplashComment.create(:content => Faker::Lorem.sentence)
      splash.splash_comments <<  splash_comment
      user.splash_comments << splash_comment

    end
	end
end

# # User.all.each do |user|

# #   splashesarr = Splash.all.sample(5)
# #   splashesarr.each do |splash|
# #     user.splashes << splash
# #   end

# # end
# # =================================== SEED TEST SUITE FOR LAT/LONG SPLASH POPULATION =============================
# user1 = User.create(:fb_id => 'user1',
#                     :latitude =>  32.701179949806,
#                     :longitude => 41.513759165783,
#                     :first_name => 'name1')
# user2 = User.create(:fb_id => 'user2',
#                     :latitude =>  32.701179949816,
#                     :longitude => 41.513759165783,
#                     :first_name => 'name2')
# user3 = User.create(:fb_id => 'user3',
#                     :latitude =>  32.701179949906,
#                     :longitude => 41.513759165783,
#                     :first_name => 'name3')
# user4 = User.create(:fb_id => 'user4',
#                     :latitude =>  32.701179950806,
#                     :longitude => 41.513759165783,
#                     :first_name => 'name4')
# user5 = User.create(:fb_id => 'user5',
#                     :latitude =>  32.701179959806,
#                     :longitude => 41.513759165783,
#                     :first_name => 'name5')
# user6 = User.create(:fb_id => 'user6',
#                     :latitude =>  32.701180049806,
#                     :longitude => 41.513759165783,
#                     :first_name => 'name6')
# user7 = User.create(:fb_id => 'user7',
#                     :latitude =>  32.701180949806,
#                     :longitude => 41.513759165783,
#                     :first_name => 'name7')
# user8 = User.create(:fb_id => 'user8',
#                     :latitude =>  32.701189949806,
#                     :longitude => 41.513759165783,
#                     :first_name => 'name8')
# user9 = User.create(:fb_id => 'user9',
#                     :latitude =>  32.701279949806,
#                     :longitude => 41.513759165783,
#                     :first_name => 'name9')
# user10 = User.create(:fb_id => 'user10',
#                     :latitude =>  32.702179949806,
#                     :longitude => 41.513759165783,
#                     :first_name => 'name10')
# user11 = User.create(:fb_id => 'user11',
#                     :latitude =>  32.711179949806,
#                     :longitude => 41.513759165783,
#                     :first_name => 'name11')
# user12 = User.create(:fb_id => 'user12',
#                     :latitude =>  32.801179949806,
#                     :longitude => 41.513759165783,
#                     :first_name => 'name12')
# user13 = User.create(:fb_id => 'user13',
#                     :latitude =>  33.701179949806,
#                     :longitude => 41.513759165783,
#                     :first_name => 'name13')
# splash = Splash.create(:content => "*********************This is the User4 splash content**********************")
# user4.splashes_created << splash


# # ================== TEST FOR DESTROYING OLD SPLASHES ON "get '/splashes'" CONTROLLER ROUTE ============
# splash_old = Splash.create(:created_at => '2014-11-09 00:40:55', :content => "@@@@@@@@@@@@@@@@@@@@ USER 13 @@@@@@@@@@@@@@@@@@@@", :latitude => 32.701179950806, :longitude => 41.513759165783)
# user13.splashes_created << splash_old

# Splash.all.each do |splash|
#     splash.splash_comments << SplashComment.create(:content => Faker::Lorem.sentence, :user_id => User.all.sample.id)
#     end
user = User.create(:fb_id => Faker::Internet.user_name,
    :latitude => 37.756171,
    :longitude => -122.475096, :first_name => Faker::Name.first_name, :last_name => Faker::Name.last_name)
5.times do |x|
splash = Splash.create(:content => Faker::Lorem.sentence)
    user.splashes_created << splash
5.times do |y|
  splash_comment = SplashComment.create(:content => Faker::Lorem.sentence)
  splash.splash_comments <<  splash_comment
  user.splash_comments << splash_comment

end
end
