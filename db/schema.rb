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

ActiveRecord::Schema.define(version: 20160323113655) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "attachinary_files", force: :cascade do |t|
    t.integer  "attachinariable_id"
    t.string   "attachinariable_type"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachinary_files", ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree

  create_table "bookings", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "slot_id"
    t.boolean  "accepted"
    t.integer  "commission"
  end

  add_index "bookings", ["slot_id"], name: "index_bookings_on_slot_id", using: :btree
  add_index "bookings", ["user_id"], name: "index_bookings_on_user_id", using: :btree

  create_table "contracts", force: :cascade do |t|
    t.string   "contract_type"
    t.integer  "booking_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "contracts", ["booking_id"], name: "index_contracts_on_booking_id", using: :btree

  create_table "conversations", force: :cascade do |t|
    t.integer  "user1_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user2_id"
  end

  add_index "conversations", ["user1_id"], name: "index_conversations_on_user1_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
    t.integer  "conversation_id"
    t.datetime "read_at"
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.text     "content"
    t.integer  "rating"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "reviewer_id"
    t.integer  "reviewed_id"
    t.integer  "booking_id"
  end

  create_table "slots", force: :cascade do |t|
    t.string   "status"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "commission"
  end

  add_index "slots", ["user_id"], name: "index_slots_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "has_practice"
    t.string   "numero_ordre"
    t.string   "address"
    t.string   "speciality"
    t.string   "avatar"
    t.string   "numero_ursaff"
    t.text     "presentation"
    t.text     "education"
    t.text     "publications"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "admin",                  default: false,    null: false
    t.string   "convention"
    t.boolean  "housing"
    t.boolean  "secretary"
    t.string   "house_visits"
    t.integer  "commission"
    t.string   "house_visits_tolerance", default: "above2"
    t.boolean  "nosecretary_tolerance",  default: true
    t.boolean  "nohousing_tolerance",    default: true
    t.integer  "min_commission",         default: 0
    t.string   "card_id"
    t.string   "validated"
    t.boolean  "student",                default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "bookings", "users"
  add_foreign_key "contracts", "bookings"
  add_foreign_key "conversations", "users", column: "user1_id"
  add_foreign_key "slots", "users"
end
