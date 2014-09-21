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

ActiveRecord::Schema.define(version: 20140921001830) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "crimes", force: true do |t|
    t.float    "longitude"
    t.float    "latitude"
    t.integer  "year"
    t.integer  "month"
    t.integer  "x"
    t.integer  "y"
    t.float    "TOT"
    t.string   "crimeType"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "crimes", ["crimeType"], name: "index_crimes_on_crimeType", using: :btree
  add_index "crimes", ["latitude"], name: "index_crimes_on_latitude", using: :btree
  add_index "crimes", ["longitude"], name: "index_crimes_on_longitude", using: :btree

  create_table "interest_points", force: true do |t|
    t.float    "latitude",   null: false
    t.float    "longitude",  null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "interest_points", ["latitude"], name: "index_interest_points_on_latitude", using: :btree
  add_index "interest_points", ["longitude"], name: "index_interest_points_on_longitude", using: :btree
  add_index "interest_points", ["user_id"], name: "index_interest_points_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree

end
