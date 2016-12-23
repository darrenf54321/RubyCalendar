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

ActiveRecord::Schema.define(version: 20161222084622) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendships", force: :cascade do |t|
    t.integer  "first_user_id"
    t.integer  "second_user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["first_user_id", "second_user_id"], name: "index_friendships_on_first_user_id_and_second_user_id", unique: true, using: :btree
    t.index ["first_user_id"], name: "index_friendships_on_first_user_id", using: :btree
    t.index ["second_user_id"], name: "index_friendships_on_second_user_id", using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id", "user_id"], name: "index_memberships_on_group_id_and_user_id", unique: true, using: :btree
    t.index ["group_id"], name: "index_memberships_on_group_id", using: :btree
    t.index ["user_id"], name: "index_memberships_on_user_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "completed"
    t.integer  "rating"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "calendar_event_id"
    t.index ["calendar_event_id"], name: "index_reviews_on_calendar_event_id", using: :btree
  end

  create_table "calendar_event_joins", force: :cascade do |t|
    t.integer  "calendar_event_id"
    t.integer  "user_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["calendar_event_id", "user_id"], name: "index_calendar_event_joins_on_calendar_event_id_and_user_id", unique: true, using: :btree
    t.index ["calendar_event_id"], name: "index_calendar_event_joins_on_calendar_event_id", using: :btree
    t.index ["user_id"], name: "index_calendar_event_joins_on_user_id", using: :btree
  end

  create_table "calendar_events", force: :cascade do |t|
    t.string   "name"
    t.datetime "start_time"
    t.string   "calendar_completed"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
    t.string   "details"
    t.index ["user_id"], name: "index_calendar_events_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "mobile_number"
    t.integer  "group_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "username"
    t.string   "postcode"
    t.integer  "rating"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "reviews", "calendar_events"
  add_foreign_key "calendar_events", "users"
end
