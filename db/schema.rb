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

ActiveRecord::Schema.define(version: 20141130214453) do

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
    t.date     "idea_at"
    t.date     "lead_at"
    t.date     "initial_contact_at"
    t.date     "needs_analysis_at"
    t.date     "solution_development_at"
    t.date     "negotiation_at"
    t.date     "won_lost_at"
    t.string   "source_detail"
    t.string   "contact_name"
    t.string   "email",                   default: "", null: false
    t.string   "encrypted_password",      default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "est_effort_days"
    t.integer  "lost_reason_type_id"
    t.string   "lost_reason"
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

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
