# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141227060821) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auths", force: true do |t|
    t.integer  "user_id"
    t.string   "access_token"
    t.string   "fb_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "splash_comments", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "splash_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "splashes", force: true do |t|
    t.string   "content"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "splashes", ["latitude"], name: "index_splashes_on_latitude", using: :btree
  add_index "splashes", ["longitude"], name: "index_splashes_on_longitude", using: :btree

  create_table "user_splashes", force: true do |t|
    t.integer  "user_id"
    t.integer  "splash_id"
    t.float    "distance_in_meters"
    t.float    "user_latitude"
    t.float    "user_longitude"
    t.boolean  "favorited",          default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.integer  "age_range"
    t.integer  "score",       default: 0
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "email"
    t.string   "fb_id"
    t.string   "profile_pic", default: "http://robohash.org/quoremodio.png?size=300x300"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
