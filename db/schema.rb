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

ActiveRecord::Schema.define(version: 20131125040848) do

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority"

  create_table "houses", force: true do |t|
    t.string   "house_name"
    t.string   "address"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "latitude",     precision: 9, scale: 6
    t.decimal  "longitude",    precision: 9, scale: 6
  end

  create_table "registrations", force: true do |t|
    t.string   "registration_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "residencies", force: true do |t|
    t.integer  "user_id",    limit: 255
    t.integer  "house_id",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "phone_number"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "outstanding_request_id"
  end

  create_table "whos_home_requests", force: true do |t|
    t.integer  "user_id"
    t.integer  "num_recipients"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "whos_home_responses", force: true do |t|
    t.integer  "whos_home_request_id"
    t.integer  "user_id"
    t.boolean  "is_home"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
