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

ActiveRecord::Schema.define(version: 20150924135902) do

  create_table "courses", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "university_id", limit: 4,   default: 1
  end

  add_index "courses", ["university_id"], name: "index_courses_on_university_id", using: :btree

  create_table "semesters", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "year_id",    limit: 4,   default: 4
  end

  add_index "semesters", ["year_id"], name: "index_semesters_on_year_id", using: :btree

  create_table "topics", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "code",       limit: 255
    t.string   "attachment", limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "unit_id",    limit: 4,   default: 1
  end

  add_index "topics", ["unit_id"], name: "index_topics_on_unit_id", using: :btree

  create_table "units", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "semester_id", limit: 4,   default: 1
  end

  add_index "units", ["semester_id"], name: "index_units_on_semester_id", using: :btree

  create_table "universities", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "years", force: :cascade do |t|
    t.string   "year",       limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "course_id",  limit: 4,   default: 1
  end

  add_index "years", ["course_id"], name: "index_years_on_course_id", using: :btree

  add_foreign_key "courses", "universities"
  add_foreign_key "semesters", "years"
  add_foreign_key "topics", "units"
  add_foreign_key "units", "semesters"
  add_foreign_key "years", "courses"
end
