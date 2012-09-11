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

ActiveRecord::Schema.define(:version => 20120911231509) do

  create_table "bookmarks", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.text     "url"
    t.boolean  "published",   :default => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "strikes",     :default => 0
  end

  create_table "bookmarks_challenges", :force => true do |t|
    t.integer "challenge_id"
    t.integer "bookmark_id"
  end

  create_table "bookmarks_tags", :force => true do |t|
    t.integer "bookmark_id"
    t.integer "tag_id"
  end

  create_table "bookmarks_warblings", :force => true do |t|
    t.integer "warbling_id"
    t.integer "bookmark_id"
  end

  create_table "challenges", :force => true do |t|
    t.string  "title"
    t.text    "description"
    t.integer "gig_id"
    t.integer "venture_id"
    t.boolean "featured",    :default => false
    t.boolean "active",      :default => false
    t.string  "slug"
    t.string  "contact"
    t.boolean "open",        :default => true
  end

  create_table "challenges_warblings", :force => true do |t|
    t.integer "challenge_id"
    t.integer "warbling_id"
  end

  create_table "chapters", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "city"
    t.string   "country"
    t.string   "slug"
  end

  add_index "chapters", ["slug"], :name => "index_chapters_on_slug", :unique => true

  create_table "contributions", :force => true do |t|
    t.string   "url"
    t.text     "description"
    t.boolean  "accepted",     :default => false
    t.integer  "user_id"
    t.integer  "challenge_id"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "skill_id"
  end

  create_table "friends", :force => true do |t|
    t.string "name"
    t.string "url"
    t.string "logo"
    t.string "description"
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
    t.string   "slug"
  end

  add_index "gigs", ["slug"], :name => "index_gigs_on_slug", :unique => true

  create_table "ideas", :force => true do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "challenge_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "locations", :force => true do |t|
    t.string "name"
    t.string "latitude"
    t.string "longitude"
    t.string "address"
    t.string "postcode"
    t.string "notes"
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
    t.string  "name"
    t.string  "url"
    t.string  "logo"
    t.boolean "active",  :default => false
    t.string  "purpose"
    t.string  "email"
    t.text    "notes"
    t.string  "contact"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "warbling_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "user_id"
    t.integer  "chapter_id"
    t.integer  "wordpress_id"
    t.text     "excerpt"
    t.string   "hero_image"
    t.string   "slug"
  end

  add_index "posts", ["slug"], :name => "index_conversation_posts_on_slug", :unique => true

  create_table "skills", :force => true do |t|
    t.string "title"
  end

  create_table "slots", :force => true do |t|
    t.integer "skill_id"
    t.integer "gig_id"
    t.integer "limit"
    t.integer "social_id"
  end

  create_table "slots_users", :force => true do |t|
    t.integer "slot_id"
    t.integer "user_id"
  end

  create_table "socials", :force => true do |t|
    t.text     "description"
    t.string   "location"
    t.datetime "start_time"
    t.integer  "chapter_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "slug"
  end

  create_table "tags", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
  end

  add_index "tags", ["slug"], :name => "index_conversation_tags_on_slug", :unique => true

  create_table "talents", :force => true do |t|
    t.integer "user_id"
    t.integer "skill_id"
    t.integer "level",    :default => 0
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
    t.string   "url"
    t.string   "twitter_handle"
    t.string   "location"
    t.string   "gender"
    t.integer  "age"
    t.text     "reasons_for_joining"
    t.string   "slug"
    t.boolean  "activated",              :default => false
    t.boolean  "crew",                   :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["slug"], :name => "index_users_on_slug", :unique => true

  create_table "users_warblings", :force => true do |t|
    t.integer "warbling_id"
    t.integer "user_id"
  end

  create_table "ventures", :force => true do |t|
    t.string "logo"
    t.string "name"
    t.string "url"
  end

  create_table "warblings", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
  end

  add_index "warblings", ["slug"], :name => "index_conversation_categories_on_slug", :unique => true

end
