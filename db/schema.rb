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

ActiveRecord::Schema.define(version: 20150924174956) do

  create_table "plant_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plant_generic_names", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "planters", force: true do |t|
    t.string   "name"
    t.integer  "length"
    t.integer  "width"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plants", force: true do |t|
    t.string   "name"
    t.boolean  "climb"
    t.integer  "persqft"
    t.integer  "first_planting"
    t.integer  "first_planting_duration"
    t.integer  "first_planting_maturity"
    t.integer  "second_planting"
    t.integer  "second_planting_duration"
    t.integer  "second_planting_maturity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "sun"
    t.text     "notes"
    t.integer  "plant_generic_name_id"
    t.integer  "plant_category_id"
  end

  create_table "squares", force: true do |t|
    t.integer  "planter_id"
    t.integer  "plant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "unit"
  end

end
