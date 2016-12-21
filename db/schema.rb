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

ActiveRecord::Schema.define(version: 20161221223823) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "art_object_tags", force: :cascade do |t|
    t.integer "tag_id"
    t.integer "art_object_id"
  end

  create_table "art_objects", force: :cascade do |t|
    t.integer  "museum_id"
    t.integer  "medium_id"
    t.string   "title"
    t.string   "date"
    t.string   "artist"
    t.string   "description"
    t.string   "dimensions"
    t.string   "thumbnail_url"
    t.string   "image_url"
    t.string   "place"
    t.string   "link_to_object"
    t.string   "credit_line"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "vr_url"
  end

  create_table "collection_art_objects", force: :cascade do |t|
    t.integer "collection_id"
    t.integer "art_object_id"
  end

  create_table "collections", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "primary_object_id"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "collection_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "collection_id"
  end

  create_table "media", force: :cascade do |t|
    t.string   "medium_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "museums", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tag_collections", force: :cascade do |t|
    t.integer "tag_id"
    t.integer "collection_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string   "access_token"
    t.string   "username"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
