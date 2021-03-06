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

ActiveRecord::Schema.define(version: 20171015011544) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "itineraries", force: :cascade do |t|
    t.boolean  "approved"
    t.text     "raw"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "trip_id"
    t.index ["trip_id"], name: "index_itineraries_on_trip_id", using: :btree
  end

  create_table "places", force: :cascade do |t|
    t.string   "description"
    t.decimal  "lat"
    t.decimal  "lng"
    t.string   "google_place_id"
    t.boolean  "approved"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "tests", force: :cascade do |t|
    t.string   "set_name"
    t.integer  "row_number"
    t.string   "request_url"
    t.boolean  "approved"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "trips", force: :cascade do |t|
    t.string   "set_name"
    t.integer  "row_number"
    t.string   "request_url"
    t.boolean  "approved"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "origin_id"
    t.integer  "destination_id"
    t.index ["destination_id"], name: "index_trips_on_destination_id", using: :btree
    t.index ["origin_id"], name: "index_trips_on_origin_id", using: :btree
  end

  add_foreign_key "itineraries", "trips"
  add_foreign_key "trips", "places", column: "destination_id"
  add_foreign_key "trips", "places", column: "origin_id"
end
