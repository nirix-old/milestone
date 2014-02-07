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

ActiveRecord::Schema.define(version: 20140207154304) do

  create_table "groups", force: true do |t|
    t.string   "name"
    t.boolean  "is_admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "issues", force: true do |t|
    t.string   "summary"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "project_id"
    t.integer  "status_id"
    t.boolean  "is_closed"
    t.integer  "type_id"
    t.integer  "version_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", force: true do |t|
    t.string   "name"
    t.text     "value"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "name"
    t.string   "email"
    t.integer  "group_id",        default: 2, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "versions", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "description"
    t.integer  "project_id"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
