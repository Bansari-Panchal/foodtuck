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

ActiveRecord::Schema.define(version: 2020_07_09_093834) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.boolean "is_active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories_vendors", id: false, force: :cascade do |t|
    t.integer "vendor_id"
    t.integer "category_id"
  end

  create_table "choices", force: :cascade do |t|
    t.string "name"
    t.boolean "allow_multiple"
    t.integer "position"
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_choices_on_product_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "state_name"
    t.string "state_code"
    t.string "country_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "likeable_id"
    t.string "likeable_type"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "line_item_options", force: :cascade do |t|
    t.string "description"
    t.decimal "cost_in_dollars"
    t.bigint "option_id", null: false
    t.bigint "line_item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["line_item_id"], name: "index_line_item_options_on_line_item_id"
    t.index ["option_id"], name: "index_line_item_options_on_option_id"
  end

  create_table "line_items", force: :cascade do |t|
    t.decimal "cost_in_dollars", precision: 6, scale: 2
    t.string "description"
    t.string "special_instruction"
    t.integer "quantity"
    t.bigint "order_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_line_items_on_order_id"
    t.index ["product_id"], name: "index_line_items_on_product_id"
  end

  create_table "options", force: :cascade do |t|
    t.string "name"
    t.decimal "cost_in_dollars"
    t.integer "position"
    t.bigint "choice_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["choice_id"], name: "index_options_on_choice_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.decimal "tip_in_dollar"
    t.string "description"
    t.datetime "completed_at"
    t.datetime "pickup_at"
    t.string "order_number"
    t.boolean "sent_review_email", default: false, null: false
    t.string "order_note"
    t.string "selected_tip"
    t.integer "print_count", default: 0, null: false
    t.datetime "scedual_datetime"
    t.bigint "user_id", null: false
    t.bigint "vendor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
    t.index ["vendor_id"], name: "index_orders_on_vendor_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "vendor_id", null: false
    t.string "name"
    t.text "description"
    t.decimal "cost_in_dollars"
    t.integer "position"
    t.boolean "availability"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "menu_category"
    t.string "item_tags"
    t.boolean "popular"
    t.string "item_image_file_name"
    t.string "item_image_content_type"
    t.bigint "item_image_file_size"
    t.datetime "item_image_updated_at"
    t.boolean "is_catering"
    t.index ["vendor_id"], name: "index_products_on_vendor_id"
  end

  create_table "taxes", force: :cascade do |t|
    t.string "desc"
    t.decimal "amount"
    t.boolean "is_percentage"
    t.bigint "vendor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "terms"
    t.index ["vendor_id"], name: "index_taxes_on_vendor_id"
  end

  create_table "user_providers", force: :cascade do |t|
    t.bigint "user_id"
    t.string "provider"
    t.string "uid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_providers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "image_file_name"
    t.string "image_content_type"
    t.bigint "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "timezone"
    t.date "birthdate"
    t.string "phone"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name"
    t.string "tagline"
    t.text "description"
    t.integer "order_fulfillment_time_in_minutes"
    t.integer "price_point"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_vendors_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "choices", "products"
  add_foreign_key "likes", "users"
  add_foreign_key "line_item_options", "line_items"
  add_foreign_key "line_item_options", "options"
  add_foreign_key "line_items", "orders"
  add_foreign_key "line_items", "products"
  add_foreign_key "options", "choices"
  add_foreign_key "orders", "users"
  add_foreign_key "orders", "vendors"
  add_foreign_key "products", "vendors"
  add_foreign_key "taxes", "vendors"
  add_foreign_key "vendors", "users"
end
