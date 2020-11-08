# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_08_162340) do

  create_table "addresses", force: :cascade do |t|
    t.integer "provinces_id", null: false
    t.integer "customers_id", null: false
    t.boolean "is_primary_address", null: false
    t.string "postal_code", null: false
    t.string "country", null: false
    t.string "city", null: false
    t.string "address_line_one", null: false
    t.string "address_line_two"
    t.string "address_additional"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customers_id"], name: "index_addresses_on_customers_id"
    t.index ["provinces_id"], name: "index_addresses_on_provinces_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name", null: false
    t.string "username", null: false
    t.string "email", null: false
    t.string "password", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "address_id", null: false
    t.datetime "order_date"
    t.decimal "historic_pst_rate"
    t.decimal "historic_gst_rate"
    t.decimal "historic_hst_rate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_orders_on_address_id"
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "upc", null: false
    t.decimal "price", null: false
    t.decimal "cost", null: false
    t.text "description"
    t.integer "on_hand", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
  end

  create_table "provinces", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", null: false
    t.decimal "pst_rate"
    t.decimal "gst_rate"
    t.decimal "hst_rate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "orders", "addresses"
  add_foreign_key "orders", "customers"
end
