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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120614122024) do

  create_table "blog_categories", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "blog_posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "category_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "user_id"
    t.integer  "chapter_id"
    t.integer  "wordpress_id"
    t.text     "excerpt"
    t.string   "hero_image"
  end

  create_table "bookmarks_tags", :force => true do |t|
    t.integer "tag_id"
    t.integer "bookmark_id"
  end

  create_table "briefs", :force => true do |t|
    t.string  "title"
    t.text    "description"
    t.integer "gig_id"
    t.integer "venture_id"
  end

  create_table "chapters", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "city"
    t.string   "country"
  end

  create_table "events_users", :id => false, :force => true do |t|
    t.integer "event_id"
    t.integer "user_id"
  end

  create_table "friends", :force => true do |t|
    t.string "name"
    t.string "url"
    t.string "logo"
  end

  create_table "friends_gigs", :force => true do |t|
    t.integer "gig_id"
    t.integer "friend_id"
  end

  create_table "gigs", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "location"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "chapter_id"
    t.integer  "partner_id"
    t.string   "poster"
    t.string   "logo"
  end

  create_table "gigs_skills", :force => true do |t|
    t.integer "gig_id"
    t.integer "skill_id"
  end

  create_table "library_bookmarks", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.text     "url"
    t.boolean  "curated",     :default => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "library_tags", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ning_profiles", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "email"
    t.string   "gender"
    t.string   "location"
    t.string   "country"
    t.string   "zip"
    t.string   "age"
    t.string   "website"
    t.string   "twitter"
    t.date     "birthdate"
    t.text     "reasons_for_joining"
    t.text     "skills"
    t.boolean  "notification_broadcasts", :default => false
    t.boolean  "notification_email",      :default => false
    t.date     "date_joined"
    t.date     "last_visit"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "partners", :force => true do |t|
    t.string "name"
    t.string "url"
    t.string "logo"
  end

  create_table "skills", :force => true do |t|
    t.string "title"
  end

  create_table "skills_users", :force => true do |t|
    t.integer "skill_id"
    t.integer "user_id"
  end

  create_table "slots", :force => true do |t|
    t.integer "skill_id"
    t.integer "gig_id"
    t.integer "limit"
  end

  create_table "slots_users", :force => true do |t|
    t.integer "slot_id"
    t.integer "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "admin",                  :default => false
    t.string   "name"
    t.string   "avatar"
    t.integer  "chapter_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "ventures", :force => true do |t|
    t.string "logo"
    t.string "name"
    t.string "url"
  end

end
