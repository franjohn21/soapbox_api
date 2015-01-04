class CreateUserSplashes < ActiveRecord::Migration
  def change
    create_table :user_splashes do |t|
    	t.references :user 
    	t.references :splash
    	t.float :distance_in_meters, :user_latitude, :user_longitude
    	t.boolean :favorited, :default => :false

    	t.timestamps
    end
  end
end
