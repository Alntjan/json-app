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

ActiveRecord::Schema.define(version: 20161116172748) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "orders", force: :cascade do |t|
    t.integer  "shop_id",          null: false
    t.bigint   "shopify_order_id", null: false
    t.jsonb    "order_data"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["order_data"], name: "index_orders_on_order_data", using: :gin
    t.index ["shop_id"], name: "index_orders_on_shop_id", using: :btree
    t.index ["shopify_order_id"], name: "index_orders_on_shopify_order_id", unique: true, using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "handle"
    t.string   "image"
    t.string   "title"
    t.string   "vendor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shops", force: :cascade do |t|
    t.string   "shopify_domain", null: false
    t.string   "shopify_token",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["shopify_domain"], name: "index_shops_on_shopify_domain", unique: true, using: :btree
  end

  add_foreign_key "orders", "shops", on_delete: :cascade
end
