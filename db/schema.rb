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

ActiveRecord::Schema.define(version: 20150811175720) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "topic"
    t.integer  "depth"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: true do |t|
    t.string   "name"
    t.string   "topic"
    t.string   "image_path"
    t.integer  "image_size"
    t.integer  "posting_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "joins", force: true do |t|
    t.string   "comment"
    t.integer  "project_id"
    t.integer  "user_id"
    t.string   "status"
    t.date     "read"
    t.date     "cancaled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "likes", force: true do |t|
    t.integer  "posting_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "postings", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "topic"
    t.string   "category"
    t.integer  "owner_id"
    t.integer  "child_category_id"
    t.integer  "root_category_id"
    t.string   "status"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "main_image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publics", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "topic"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shares", force: true do |t|
    t.integer  "posting_id"
    t.integer  "user_id"
    t.string   "outer_url"
    t.string   "outer_platform"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_skills", force: true do |t|
    t.string   "skill_name"
    t.string   "root_category"
    t.string   "child_category"
    t.integer  "child_category_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "user_type"
    t.string   "sns_url"
    t.text     "biography"
    t.string   "facebook_id"
    t.string   "google_id"
    t.string   "facebook_token"
    t.string   "google_token"
    t.date     "last_login"
    t.string   "profile_image"
    t.string   "gender"
    t.integer  "age"
    t.string   "mobile_token"
    t.string   "mobile_secret"
    t.date     "mobile_token_created"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.datetime "expires_at"
  end

  create_table "versions", force: true do |t|
    t.integer  "version_code"
    t.string   "version_name"
    t.string   "platform"
    t.boolean  "forced"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
