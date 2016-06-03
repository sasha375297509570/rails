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

ActiveRecord::Schema.define(version: 20160603153943) do

  create_table "days", force: :cascade do |t|
    t.integer "number", limit: 4
    t.integer "month",  limit: 4
    t.integer "year",   limit: 4
  end

  create_table "departaments", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "employees", force: :cascade do |t|
    t.string  "name",           limit: 255
    t.integer "departament_id", limit: 4
  end

  add_index "employees", ["departament_id"], name: "index_employees_on_departament_id", using: :btree

  create_table "employees_days", force: :cascade do |t|
    t.integer "employee_id", limit: 4, null: false
    t.integer "day_id",      limit: 4, null: false
    t.string  "kind",        limit: 1, null: false
  end

  add_index "employees_days", ["day_id"], name: "index_employees_days_on_day_id", using: :btree
  add_index "employees_days", ["employee_id", "day_id"], name: "employee_id", unique: true, using: :btree
  add_index "employees_days", ["employee_id"], name: "index_employees_days_on_employee_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "failed_attempts",        limit: 4,   default: 0,  null: false
    t.string   "unlock_token",           limit: 255
    t.datetime "locked_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  add_foreign_key "employees", "departaments"
  add_foreign_key "employees_days", "days"
  add_foreign_key "employees_days", "employees"
end
