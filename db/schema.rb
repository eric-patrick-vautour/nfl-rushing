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

ActiveRecord::Schema.define(version: 20171024153514) do

  create_table "nfl_rushings", force: :cascade do |t|
    t.string   "player",             limit: 255
    t.string   "team",               limit: 255
    t.string   "pos",                limit: 255
    t.integer  "att",                limit: 4
    t.float    "att_g",              limit: 24
    t.integer  "yds",                limit: 4
    t.float    "avg",                limit: 24
    t.float    "yds_g",              limit: 24
    t.integer  "td",                 limit: 4
    t.string   "lng",                limit: 255
    t.integer  "first_down",         limit: 4
    t.float    "first_down_percent", limit: 24
    t.integer  "yards_20",           limit: 4
    t.integer  "yards_40",           limit: 4
    t.integer  "fum",                limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "nfl_rushings", ["player"], name: "player_idx", using: :btree

end
