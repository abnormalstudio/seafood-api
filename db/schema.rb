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

ActiveRecord::Schema.define(version: 2018_11_24_213756) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "catches", force: :cascade do |t|
    t.integer "fish_id", null: false
    t.integer "fishery_id", null: false
    t.date "caught_on", null: false
    t.decimal "latitude", precision: 10, scale: 6, null: false
    t.decimal "longitude", precision: 10, scale: 6, null: false
    t.string "code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location", null: false
    t.index ["code"], name: "index_catches_on_code", unique: true
    t.index ["fish_id"], name: "index_catches_on_fish_id"
    t.index ["fishery_id"], name: "index_catches_on_fishery_id"
    t.index ["latitude", "longitude"], name: "index_catches_on_latitude_and_longitude"
  end

  create_table "fisheries", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.string "contact", null: false
    t.string "phone", null: false
    t.string "email"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_fisheries_on_name"
  end

  create_table "fishes", force: :cascade do |t|
    t.string "species", null: false
    t.float "mercury_mean_ppm"
    t.integer "mercury_num_samples"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "nutrients", default: [], null: false
    t.index ["species"], name: "index_fishes_on_species"
  end

  create_table "scans", force: :cascade do |t|
    t.integer "catch_id", null: false
    t.string "scanner", null: false
    t.decimal "latitude", precision: 10, scale: 6, null: false
    t.decimal "longitude", precision: 10, scale: 6, null: false
    t.datetime "scanned_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["catch_id"], name: "index_scans_on_catch_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "name", null: false
    t.boolean "admin", default: false, null: false
    t.integer "fishery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["fishery_id"], name: "index_users_on_fishery_id"
  end

end
