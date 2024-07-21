# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2024_07_20_155547) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cabs", force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.boolean "availability"
    t.string "cab_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customer_requests", force: :cascade do |t|
    t.float "start_latitude"
    t.float "start_longitude"
    t.float "end_latitude"
    t.float "end_longitude"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rides", force: :cascade do |t|
    t.bigint "cab_id", null: false
    t.bigint "customer_request_id", null: false
    t.float "start_latitude"
    t.float "start_longitude"
    t.float "end_latitude"
    t.float "end_longitude"
    t.float "fare"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cab_id"], name: "index_rides_on_cab_id"
    t.index ["customer_request_id"], name: "index_rides_on_customer_request_id"
  end

  add_foreign_key "rides", "cabs"
  add_foreign_key "rides", "customer_requests"
end
