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

ActiveRecord::Schema.define(version: 2020_05_18_111007) do

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

  create_table "choices", force: :cascade do |t|
    t.string "name"
    t.boolean "allow_multiple"
    t.integer "position"
    t.integer "product_id", null: false
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

  create_table "options", force: :cascade do |t|
    t.string "name"
    t.decimal "cost_in_dollars"
    t.integer "position"
    t.integer "choice_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["choice_id"], name: "index_options_on_choice_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "vendor_id", null: false
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

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "taxes", force: :cascade do |t|
    t.string "desc"
    t.decimal "amount"
    t.boolean "is_percentage"
    t.integer "vendor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "terms"
    t.index ["vendor_id"], name: "index_taxes_on_vendor_id"
  end

  create_table "user_providers", force: :cascade do |t|
    t.integer "user_id"
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
    t.integer "phone"
    t.string "name"
    t.string "image_file_name"
    t.string "image_content_type"
    t.bigint "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "timezone"
    t.date "birthdate"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name"
    t.string "tagline"
    t.text "description"
    t.integer "order_fulfillment_time_in_minutes"
    t.integer "price_point"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "featured_image_file_name"
    t.string "featured_image_content_type"
    t.bigint "featured_image_file_size"
    t.datetime "featured_image_updated_at"
    t.index ["user_id"], name: "index_vendors_on_user_id"
  end

  create_table "vendors_categories", id: false, force: :cascade do |t|
    t.integer "vendor_id"
    t.integer "category_id"
  end

  add_foreign_key "choices", "products"
  add_foreign_key "options", "choices"
  add_foreign_key "products", "vendors"
  add_foreign_key "taxes", "vendors"
  add_foreign_key "vendors", "users"
end
