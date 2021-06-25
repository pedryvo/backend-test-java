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

ActiveRecord::Schema.define(version: 2021_06_25_210436) do

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "ssn"
    t.string "address"
    t.string "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "hour_price_car"
    t.float "hour_price_motorcycle"
  end

  create_table "parking_tickets", force: :cascade do |t|
    t.integer "vehicle_id", null: false
    t.integer "company_id", null: false
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_parking_tickets_on_company_id"
    t.index ["vehicle_id"], name: "index_parking_tickets_on_vehicle_id"
  end

  create_table "slots_fields", force: :cascade do |t|
    t.integer "car_slots_size"
    t.integer "moto_slots_size"
    t.integer "busy_car_slots"
    t.integer "busy_moto_slots"
    t.integer "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_slots_fields_on_company_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "brand"
    t.string "model"
    t.string "color"
    t.string "license_plate"
    t.integer "kind"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "parking_tickets", "companies"
  add_foreign_key "parking_tickets", "vehicles"
  add_foreign_key "slots_fields", "companies"
end
