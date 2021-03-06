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

ActiveRecord::Schema.define(version: 20150430173708) do

  create_table "activities", force: :cascade do |t|
    t.string "resource"
    t.string "activity"
  end

  create_table "activities_roles", id: false, force: :cascade do |t|
    t.integer "role_id",     null: false
    t.integer "activity_id", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "firstname",  limit: 255
    t.string   "lastname",   limit: 255
    t.string   "email",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news_releases", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.date     "released_on"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phones", force: :cascade do |t|
    t.integer  "contact_id"
    t.string   "phone",      limit: 255
    t.string   "phone_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "phones", ["contact_id"], name: "index_phones_on_contact_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "role_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
  end

end
