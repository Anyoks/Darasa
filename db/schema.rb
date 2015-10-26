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

ActiveRecord::Schema.define(version: 20151023064709) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cats", force: :cascade do |t|
    t.string   "cat_name"
    t.string   "attachment"
    t.datetime "date"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "unit_id",    default: 3
  end

  add_index "cats", ["unit_id"], name: "index_cats_on_unit_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "university_id", default: 1
  end

  add_index "courses", ["university_id"], name: "index_courses_on_university_id", using: :btree

  create_table "exams", force: :cascade do |t|
    t.string   "exam_name"
    t.string   "attachment"
    t.datetime "date"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "unit_id",    default: 4
  end

  add_index "exams", ["unit_id"], name: "index_exams_on_unit_id", using: :btree

  create_table "semesters", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "year_id",    default: 1
  end

  add_index "semesters", ["year_id"], name: "index_semesters_on_year_id", using: :btree

  create_table "topics", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.string   "attachment"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "unit_id",    default: 1
  end

  add_index "topics", ["unit_id"], name: "index_topics_on_unit_id", using: :btree

  create_table "units", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "semester_id", default: 1
  end

  add_index "units", ["semester_id"], name: "index_units_on_semester_id", using: :btree

  create_table "universities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                                  null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "phone_number"
    t.string   "university"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "second_name"
    t.boolean  "admin",                  default: false
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "years", force: :cascade do |t|
    t.string   "year"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "course_id",  default: 1
  end

  add_index "years", ["course_id"], name: "index_years_on_course_id", using: :btree

  add_foreign_key "cats", "units"
  add_foreign_key "courses", "universities"
  add_foreign_key "exams", "units"
  add_foreign_key "semesters", "years"
  add_foreign_key "topics", "units"
  add_foreign_key "units", "semesters"
  add_foreign_key "years", "courses"
end
