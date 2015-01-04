class CreateSplashComments < ActiveRecord::Migration
  def change
    create_table :splash_comments do |t|
      t.string :content
      t.references :user
      t.references :splash

      t.timestamps
    end
  end
end
