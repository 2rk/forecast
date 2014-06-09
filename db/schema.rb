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

ActiveRecord::Schema.define(version: 20140608230856) do

  create_table "opportunities", force: true do |t|
    t.string   "name"
    t.string   "organisation"
    t.string   "type_id"
    t.date     "identified_at"
    t.integer  "source_id"
    t.integer  "value"
    t.integer  "weighting"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "est_close_at"
    t.integer  "stage_id"
  end

  create_table "selections", force: true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.string   "system_code"
    t.integer  "position_value"
    t.boolean  "is_default"
    t.boolean  "is_system"
    t.datetime "archived_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
