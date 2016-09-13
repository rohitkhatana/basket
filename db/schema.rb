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

ActiveRecord::Schema.define(version: 20160912213101) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_tax_rates", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "tax_rate_id", null: false
  end

  add_index "categories_tax_rates", ["category_id"], name: "index_categories_tax_rates_on_category_id"
  add_index "categories_tax_rates", ["tax_rate_id"], name: "index_categories_tax_rates_on_tax_rate_id"

  create_table "products", force: :cascade do |t|
    t.decimal  "price",       precision: 9, scale: 2
    t.string   "description"
    t.integer  "category_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id"

  create_table "tax_rates", force: :cascade do |t|
    t.string   "state"
    t.decimal  "rate",       precision: 5, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

end
