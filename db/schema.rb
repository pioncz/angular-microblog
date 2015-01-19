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

ActiveRecord::Schema.define(version: 20141218212522) do

  create_table "comments", force: true do |t|
    t.integer  "post_id"
    t.text     "content"
    t.integer  "reports"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "type"
    t.text     "content"
    t.integer  "comments_count"
    t.integer  "score"
    t.integer  "user_id"
    t.integer  "reports"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "users", force: true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "password"
    t.integer  "last_login"
    t.string   "photo"
    t.string   "background_photo"
    t.text     "description"
    t.boolean  "is_private"
    t.integer  "followers"
    t.integer  "followees"
    t.integer  "reports"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
