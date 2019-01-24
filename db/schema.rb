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

ActiveRecord::Schema.define(version: 2019_01_13_223417) do

  create_table "authors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name", null: false
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "title", null: false
    t.integer "year_published"
    t.string "isbn"
    t.decimal "price", precision: 10, scale: 2, default: "0.0", null: false
    t.boolean "out_of_print", default: false
    t.integer "views", default: 0, null: false
    t.integer "author_id"
    t.integer "supplier_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_books_on_author_id"
    t.index ["supplier_id"], name: "index_books_on_supplier_id"
  end

  create_table "books_orders", force: :cascade do |t|
    t.integer "book_id"
    t.integer "order_id"
    t.index ["book_id"], name: "index_books_orders_on_book_id"
    t.index ["order_id"], name: "index_books_orders_on_order_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name", null: false
    t.string "title"
    t.string "email", null: false
    t.integer "visits", default: 0, null: false
    t.integer "orders_count", default: 0, null: false
    t.integer "lock_version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "date_submitted"
    t.integer "customer_id"
    t.integer "status", null: false
    t.decimal "subtotal", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "shipping", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "tax", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "total", precision: 12, scale: 2, default: "0.0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title", null: false
    t.text "body"
    t.integer "rating", null: false
    t.integer "state", default: 0
    t.integer "customer_id"
    t.integer "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_reviews_on_book_id"
    t.index ["customer_id"], name: "index_reviews_on_customer_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
