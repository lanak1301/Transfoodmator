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

ActiveRecord::Schema.define(version: 20150803132845) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cooking_steps", force: :cascade do |t|
    t.integer  "step_count"
    t.string   "name"
    t.time     "time"
    t.integer  "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cooking_steps", ["recipe_id"], name: "index_cooking_steps_on_recipe_id", using: :btree

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.integer  "quantity"
    t.integer  "recipe_id"
    t.integer  "unit_of_measurement_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "ingredients", ["recipe_id"], name: "index_ingredients_on_recipe_id", using: :btree
  add_index "ingredients", ["unit_of_measurement_id"], name: "index_ingredients_on_unit_of_measurement_id", using: :btree

  create_table "recipes", force: :cascade do |t|
    t.string   "name"
    t.string   "servings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unit_of_measurements", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cooking_steps", "recipes"
  add_foreign_key "ingredients", "recipes"
  add_foreign_key "ingredients", "unit_of_measurements"
end
