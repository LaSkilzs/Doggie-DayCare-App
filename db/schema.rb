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

ActiveRecord::Schema.define(version: 2019_04_05_152814) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.date "date"
    t.time "start_time"
    t.string "status"
    t.bigint "dog_id"
    t.bigint "walker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "service_id"
    t.index ["dog_id"], name: "index_appointments_on_dog_id"
    t.index ["service_id"], name: "index_appointments_on_service_id"
    t.index ["walker_id"], name: "index_appointments_on_walker_id"
  end

  create_table "dogs", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "breed"
    t.string "size"
    t.string "restrictions"
    t.string "friendliness"
    t.string "image"
    t.bigint "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_dogs_on_owner_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.string "amount"
    t.bigint "appointment_id"
    t.boolean "walked"
    t.integer "walk_rating"
    t.string "notes"
    t.string "owner_comments"
    t.string "walker_comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "owner_id"
    t.index ["appointment_id"], name: "index_invoices_on_appointment_id"
    t.index ["owner_id"], name: "index_invoices_on_owner_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "address"
    t.string "city"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_owners_on_user_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.string "package"
    t.string "max_time"
    t.float "pkg_amount"
    t.float "hourly_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "username"
    t.string "role"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "walkers", force: :cascade do |t|
    t.integer "age"
    t.string "experience"
    t.boolean "own_dog"
    t.integer "rating"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_walkers_on_user_id"
  end

  add_foreign_key "appointments", "dogs"
  add_foreign_key "appointments", "services"
  add_foreign_key "appointments", "walkers"
  add_foreign_key "dogs", "owners"
  add_foreign_key "invoices", "appointments"
  add_foreign_key "invoices", "owners"
  add_foreign_key "owners", "users"
  add_foreign_key "walkers", "users"
end
