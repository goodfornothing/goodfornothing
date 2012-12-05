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

ActiveRecord::Schema.define(:version => 20121205144226) do

  create_table "challenges", :force => true do |t|
    t.string  "title"
    t.text    "description"
    t.integer "gig_id"
    t.integer "venture_id"
    t.boolean "featured",              :default => false
    t.boolean "active",                :default => false
    t.boolean "open",                  :default => true
    t.integer "partner_id"
    t.string  "slug"
    t.boolean "open_to_contributions", :default => true
  end

  create_table "challenges_issues", :force => true do |t|
    t.integer "challenge_id"
    t.integer "issue_id"
  end

  create_table "challenges_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "challenge_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "chapters", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "country"
    t.string   "slug"
  end

  add_index "chapters", ["slug"], :name => "index_chapters_on_slug", :unique => true

  create_table "comments", :force => true do |t|
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "challenge_id"
  end

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

  create_table "friendly_id_slugs", :force => true do |t|
    t.string   "slug",                         :null => false
    t.integer  "sluggable_id",                 :null => false
    t.string   "sluggable_type", :limit => 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type", :unique => true
  add_index "friendly_id_slugs", ["sluggable_id"], :name => "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], :name => "index_friendly_id_slugs_on_sluggable_type"

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
    t.string   "logo"
    t.string   "slug"
  end

  create_table "issues", :force => true do |t|
    t.string   "title"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "slug"
    t.text     "description"
    t.boolean  "active",      :default => true
    t.string   "icon"
    t.string   "hashtag"
  end

  create_table "issues_trills", :force => true do |t|
    t.integer "issue_id"
    t.integer "trill_id"
  end

  create_table "issues_users", :force => true do |t|
    t.integer "issue_id"
    t.integer "user_id"
  end

  create_table "messages", :force => true do |t|
    t.integer  "user_id"
    t.text     "body"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.boolean  "read",            :default => false
    t.boolean  "sent",            :default => false
    t.integer  "submission_id"
    t.string   "submission_type"
    t.string   "email"
    t.string   "name"
  end

  create_table "messaging_challenges", :force => true do |t|
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "messaging_chapters", :force => true do |t|
    t.text     "why_city"
    t.text     "why_start"
    t.text     "why_you"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "messaging_partners", :force => true do |t|
    t.string   "purpose"
    t.text     "notes"
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

  create_table "notes", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
  end

  create_table "partners", :force => true do |t|
    t.string  "url"
    t.string  "logo"
    t.boolean "active", :default => false
    t.string  "name"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "issue_id"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "user_id"
    t.integer  "chapter_id"
    t.integer  "wordpress_id"
    t.text     "excerpt"
    t.string   "hero_image"
    t.string   "slug"
    t.boolean  "gfn_update",   :default => false
    t.boolean  "published",    :default => true
  end

  add_index "posts", ["slug"], :name => "index_conversation_posts_on_slug", :unique => true

  create_table "recipients", :force => true do |t|
    t.integer "message_id"
    t.integer "user_id"
  end

  create_table "sir_trevor_images", :force => true do |t|
    t.string   "file"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "skills", :force => true do |t|
    t.string "title"
    t.text   "description"
    t.string "upper"
    t.string "lower"
  end

  create_table "slots", :force => true do |t|
    t.integer "skill_id"
    t.integer "gig_id"
    t.integer "limit"
    t.integer "social_id"
    t.string  "custom_skill"
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
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.string   "slug"
    t.string   "title"
    t.boolean  "open",        :default => false
    t.boolean  "featured",    :default => false
    t.datetime "end_time"
  end

  create_table "talents", :force => true do |t|
    t.integer "user_id"
    t.integer "skill_id"
    t.integer "level",    :default => 0
  end

  create_table "trills", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.text     "url"
    t.boolean  "published",   :default => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "strikes",     :default => 0
    t.string   "hero_image"
    t.integer  "user_id"
    t.string   "vimeo"
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
    t.boolean  "activated",              :default => true
    t.text     "brings"
    t.boolean  "subscribed",             :default => false
    t.string   "role"
    t.boolean  "can_be_contacted",       :default => true
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["slug"], :name => "index_users_on_slug", :unique => true

  create_table "ventures", :force => true do |t|
    t.string "logo"
    t.string "name"
    t.string "url"
  end

  create_table "versions", :force => true do |t|
    t.string   "item_type",      :null => false
    t.integer  "item_id",        :null => false
    t.string   "event",          :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.text     "object_changes"
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"

end
