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

ActiveRecord::Schema.define(version: 20160407144207) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"
  enable_extension "hstore"

  create_table "campus", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "campus_name"
    t.string   "location"
    t.uuid     "institution_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.datetime "deleted_at"
  end

  add_index "campus", ["deleted_at"], name: "index_campus_on_deleted_at", using: :btree
  add_index "campus", ["institution_id"], name: "index_campus_on_institution_id", using: :btree

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "courses", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.uuid     "institution_id"
    t.datetime "deleted_at"
  end

  add_index "courses", ["deleted_at"], name: "index_courses_on_deleted_at", using: :btree
  add_index "courses", ["institution_id"], name: "index_courses_on_institution_id", using: :btree

  create_table "exams", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "title"
    t.string   "attachment"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "question"
    t.uuid     "unit_id"
  end

  add_index "exams", ["unit_id"], name: "index_exams_on_unit_id", using: :btree

  create_table "failed_payments", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "user_id"
    t.uuid     "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "mpesa_code"
    t.string   "amount"
    t.datetime "deleted_at"
  end

  add_index "failed_payments", ["deleted_at"], name: "index_failed_payments_on_deleted_at", using: :btree
  add_index "failed_payments", ["topic_id"], name: "index_failed_payments_on_topic_id", using: :btree
  add_index "failed_payments", ["user_id"], name: "index_failed_payments_on_user_id", using: :btree

  create_table "institutions", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.string   "country"
    t.uuid     "type_id"
  end

  add_index "institutions", ["deleted_at"], name: "index_institutions_on_deleted_at", using: :btree
  add_index "institutions", ["type_id"], name: "index_institutions_on_type_id", using: :btree

  create_table "order_urls", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.text   "order_url"
    t.string "authentication_token"
  end

  create_table "over_pays", force: :cascade do |t|
    t.string   "topic_id"
    t.string   "mpesa_code"
    t.string   "user_id"
    t.string   "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_activities", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "user_id"
    t.uuid     "topic_id"
    t.string   "note"
    t.string   "mpesa_code"
    t.datetime "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.string   "status"
    t.datetime "deleted_at"
  end

  add_index "payment_activities", ["deleted_at"], name: "index_payment_activities_on_deleted_at", using: :btree
  add_index "payment_activities", ["topic_id"], name: "index_payment_activities_on_topic_id", using: :btree
  add_index "payment_activities", ["user_id"], name: "index_payment_activities_on_user_id", using: :btree

  create_table "payments", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "mpesa_code", null: false
    t.uuid     "topic_id"
    t.uuid     "user_id"
    t.string   "status"
    t.datetime "deleted_at"
  end

  add_index "payments", ["deleted_at"], name: "index_payments_on_deleted_at", using: :btree
  add_index "payments", ["mpesa_code"], name: "index_payments_on_mpesa_code", unique: true, using: :btree
  add_index "payments", ["topic_id"], name: "index_payments_on_topic_id", using: :btree
  add_index "payments", ["user_id"], name: "index_payments_on_user_id", using: :btree

  create_table "prices", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.float    "amount"
    t.string   "content"
    t.datetime "deleted_at"
  end

  add_index "prices", ["deleted_at"], name: "index_prices_on_deleted_at", using: :btree

  create_table "profiles", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "user_id"
    t.uuid     "institution_id", default: "02d051f9-9644-44b0-bc22-b53cd6b7096f"
    t.uuid     "course_id"
    t.uuid     "campu_id"
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
    t.hstore   "level",          default: {}
    t.datetime "deleted_at"
  end

  add_index "profiles", ["campu_id"], name: "index_profiles_on_campu_id", using: :btree
  add_index "profiles", ["course_id"], name: "index_profiles_on_course_id", using: :btree
  add_index "profiles", ["deleted_at"], name: "index_profiles_on_deleted_at", using: :btree
  add_index "profiles", ["institution_id"], name: "index_profiles_on_institution_id", using: :btree
  add_index "profiles", ["level"], name: "profiles_level_idx", using: :gin
  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "purchases", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "user_id"
    t.uuid     "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid     "payment_id"
    t.datetime "deleted_at"
  end

  add_index "purchases", ["deleted_at"], name: "index_purchases_on_deleted_at", using: :btree
  add_index "purchases", ["payment_id"], name: "index_purchases_on_payment_id", using: :btree
  add_index "purchases", ["topic_id"], name: "index_purchases_on_topic_id", using: :btree
  add_index "purchases", ["user_id"], name: "index_purchases_on_user_id", using: :btree

  create_table "question_activities", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "user_id"
    t.uuid     "question_id"
    t.datetime "time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "note"
    t.string   "name"
    t.datetime "deleted_at"
  end

  add_index "question_activities", ["deleted_at"], name: "index_question_activities_on_deleted_at", using: :btree
  add_index "question_activities", ["question_id"], name: "index_question_activities_on_question_id", using: :btree
  add_index "question_activities", ["user_id"], name: "index_question_activities_on_user_id", using: :btree

  create_table "questions", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.text     "question"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.uuid     "exam_id"
    t.uuid     "subtopic_id"
    t.datetime "deleted_at"
  end

  add_index "questions", ["deleted_at"], name: "index_questions_on_deleted_at", using: :btree
  add_index "questions", ["exam_id"], name: "index_questions_on_exam_id", using: :btree

  create_table "responses", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "answer"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.uuid     "question_id"
    t.string   "video"
    t.datetime "deleted_at"
  end

  add_index "responses", ["deleted_at"], name: "index_responses_on_deleted_at", using: :btree
  add_index "responses", ["question_id"], name: "index_responses_on_question_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "terms",      default: false
    t.datetime "deleted_at"
  end

  add_index "roles", ["deleted_at"], name: "index_roles_on_deleted_at", using: :btree

  create_table "semesters", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid     "year_id"
    t.datetime "deleted_at"
  end

  add_index "semesters", ["deleted_at"], name: "index_semesters_on_deleted_at", using: :btree
  add_index "semesters", ["year_id"], name: "index_semesters_on_year_id", using: :btree

  create_table "sms", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.text     "message"
    t.string   "phone"
    t.string   "mpesa_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "amount"
    t.string   "date"
    t.string   "time"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "deleted_at"
  end

  add_index "sms", ["deleted_at"], name: "index_sms_on_deleted_at", using: :btree

  create_table "subtopics", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.text     "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid     "topic_id"
    t.datetime "deleted_at"
  end

  add_index "subtopics", ["deleted_at"], name: "index_subtopics_on_deleted_at", using: :btree
  add_index "subtopics", ["topic_id"], name: "index_subtopics_on_topic_id", using: :btree

  create_table "systems", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "system_name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "deleted_at"
  end

  add_index "systems", ["deleted_at"], name: "index_systems_on_deleted_at", using: :btree

  create_table "table_prices", force: :cascade do |t|
    t.string "content"
    t.float  "price"
  end

  create_table "terms", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.text "terms"
  end

  create_table "topic_activities", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "user_id"
    t.uuid     "topic_id"
    t.datetime "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "note"
    t.string   "name"
    t.datetime "deleted_at"
  end

  add_index "topic_activities", ["deleted_at"], name: "index_topic_activities_on_deleted_at", using: :btree
  add_index "topic_activities", ["topic_id"], name: "index_topic_activities_on_topic_id", using: :btree
  add_index "topic_activities", ["user_id"], name: "index_topic_activities_on_user_id", using: :btree

  create_table "topics", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.string   "attachment"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.uuid     "unit_id"
    t.datetime "deleted_at"
    t.boolean  "sample",     default: false
  end

  add_index "topics", ["deleted_at"], name: "index_topics_on_deleted_at", using: :btree
  add_index "topics", ["unit_id"], name: "index_topics_on_unit_id", using: :btree

  create_table "trials", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "user_id"
    t.datetime "start_date"
    t.datetime "expiry_date"
    t.string   "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "trials", ["user_id"], name: "index_trials_on_user_id", using: :btree

  create_table "types", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "type_name"
    t.uuid     "system_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
  end

  add_index "types", ["deleted_at"], name: "index_types_on_deleted_at", using: :btree
  add_index "types", ["system_id"], name: "index_types_on_system_id", using: :btree

  create_table "unit_activities", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "user_id"
    t.uuid     "unit_id"
    t.datetime "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "note"
    t.string   "name"
    t.datetime "deleted_at"
  end

  add_index "unit_activities", ["deleted_at"], name: "index_unit_activities_on_deleted_at", using: :btree
  add_index "unit_activities", ["unit_id"], name: "index_unit_activities_on_unit_id", using: :btree
  add_index "unit_activities", ["user_id"], name: "index_unit_activities_on_user_id", using: :btree

  create_table "units", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
    t.float    "answers_price"
    t.float    "videos_price"
    t.uuid     "semester_id"
    t.uuid     "price_id"
    t.boolean  "available",      default: false
    t.datetime "deleted_at"
    t.uuid     "institution_id", default: "02d051f9-9644-44b0-bc22-b53cd6b7096f"
  end

  add_index "units", ["deleted_at"], name: "index_units_on_deleted_at", using: :btree
  add_index "units", ["institution_id"], name: "index_units_on_institution_id", using: :btree
  add_index "units", ["price_id"], name: "index_units_on_price_id", using: :btree
  add_index "units", ["semester_id"], name: "index_units_on_semester_id", using: :btree

  create_table "uploads", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "subtopic_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.string   "response_file_name"
    t.string   "response_content_type"
    t.integer  "response_file_size"
    t.datetime "response_updated_at"
    t.string   "pictures_file_name"
    t.string   "pictures_content_type"
    t.integer  "pictures_file_size"
    t.datetime "pictures_updated_at"
  end

  add_index "uploads", ["subtopic_id"], name: "index_uploads_on_subtopic_id", using: :btree

  create_table "users", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "email",                                             null: false
    t.string   "encrypted_password",                default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "phone_number"
    t.string   "university"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "second_name"
    t.boolean  "terms",                             default: false
    t.string   "provider"
    t.string   "uid"
    t.integer  "role_id"
    t.datetime "terms_updated_at"
    t.text     "authentication_token"
    t.string   "unique_session_id",      limit: 20
    t.datetime "last_seen_at"
    t.datetime "last_seen"
    t.datetime "deleted_at"
  end

  add_index "users", ["deleted_at"], name: "index_users_on_deleted_at", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

  create_table "years", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid     "course_id"
    t.datetime "deleted_at"
  end

  add_index "years", ["course_id"], name: "index_years_on_course_id", using: :btree
  add_index "years", ["deleted_at"], name: "index_years_on_deleted_at", using: :btree

  add_foreign_key "users", "roles"
end
