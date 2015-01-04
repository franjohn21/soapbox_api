class CreateUsers < ActiveRecord::Migration
 def change
 	create_table :users do |t|
 		t.integer :age_range
 		t.integer :score, :default => 0
 		t.string :first_name, :last_name, :gender, :email, :fb_id
 		t.string :profile_pic, :default => Faker::Avatar.image
 		t.float :latitude, :longitude

 		t.timestamps
 	end
 end

end
