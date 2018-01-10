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

ActiveRecord::Schema.define(version: 20180104142209) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "btree_gin"
  enable_extension "unaccent"

  create_table "air_way_bills", force: :cascade do |t|
    t.string "awb_number"
    t.string "status"
    t.integer "customer_id"
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "airports", force: :cascade do |t|
    t.string "name"
    t.string "code", limit: 4
    t.integer "city_id"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "air_way_bill_id"
    t.string "awb_number"
    t.decimal "weight"
    t.decimal "volume"
    t.decimal "chargable_weight"
    t.bigint "origin_id"
    t.bigint "destination_id"
    t.string "status"
    t.decimal "real_weight"
    t.decimal "real_volume"
    t.decimal "real_chargable_weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["air_way_bill_id"], name: "index_bookings_on_air_way_bill_id"
    t.index ["destination_id"], name: "index_bookings_on_destination_id"
    t.index ["origin_id"], name: "index_bookings_on_origin_id"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "data_fingerprint"
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "clients", force: :cascade do |t|
    t.string "api_key"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "payment_name"
    t.index ["api_key"], name: "index_clients_on_api_key", unique: true
  end

  create_table "customers", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
  end

  create_table "pages", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.boolean "active"
    t.string "url"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "destroyable", default: true
    t.index ["user_id"], name: "index_pages_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "client_id"
    t.bigint "customer_id"
    t.string "description"
    t.string "ip", limit: 46
    t.string "currency"
    t.integer "amount"
    t.string "payment_hash"
    t.string "client_hash"
    t.datetime "transaction_date"
    t.string "success_url"
    t.string "fail_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "payment_name"
    t.integer "status", default: 0
    t.jsonb "payment_data", default: {}, null: false
    t.index ["client_id"], name: "index_payments_on_client_id"
    t.index ["customer_id"], name: "index_payments_on_customer_id"
    t.index ["payment_data"], name: "index_payments_on_payment_data", using: :gin
    t.index ["payment_hash"], name: "index_payments_on_payment_hash", unique: true
  end

  create_table "segment_log_comments", force: :cascade do |t|
    t.bigint "segment_log_id"
    t.text "message"
    t.bigint "user_id"
    t.boolean "is_internal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["segment_log_id"], name: "index_segment_log_comments_on_segment_log_id"
    t.index ["user_id"], name: "index_segment_log_comments_on_user_id"
  end

  create_table "segment_logs", force: :cascade do |t|
    t.bigint "segment_id"
    t.string "oper_status"
    t.date "forwarding_date"
    t.date "flight_date"
    t.string "flight_number"
    t.datetime "etd_time"
    t.datetime "eta_time"
    t.datetime "atd_time"
    t.datetime "ata_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["segment_id"], name: "index_segment_logs_on_segment_id"
  end

  create_table "segments", force: :cascade do |t|
    t.bigint "booking_id"
    t.bigint "origin_id"
    t.bigint "destination_id"
    t.decimal "rate"
    t.string "flight_number"
    t.string "oper_status"
    t.datetime "etd_time"
    t.datetime "eta_time"
    t.datetime "atd_time"
    t.datetime "ata_time"
    t.string "status"
    t.string "carrier"
    t.integer "segment_number"
    t.date "flight_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_segments_on_booking_id"
    t.index ["destination_id"], name: "index_segments_on_destination_id"
    t.index ["origin_id"], name: "index_segments_on_origin_id"
  end

  create_table "settings", force: :cascade do |t|
    t.string "code"
    t.decimal "number_value"
    t.text "text_value"
    t.datetime "date_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "slides", force: :cascade do |t|
    t.string "title"
    t.string "caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.string "video_url"
    t.string "video_id"
    t.boolean "active"
    t.integer "position"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
    t.integer "role", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "air_way_bills"
  add_foreign_key "bookings", "airports", column: "destination_id"
  add_foreign_key "bookings", "airports", column: "origin_id"
  add_foreign_key "pages", "users"
  add_foreign_key "payments", "clients"
  add_foreign_key "payments", "customers"
  add_foreign_key "segment_log_comments", "segment_logs"
  add_foreign_key "segment_log_comments", "users"
  add_foreign_key "segment_logs", "segments"
  add_foreign_key "segments", "airports", column: "destination_id"
  add_foreign_key "segments", "airports", column: "origin_id"
  add_foreign_key "segments", "bookings"
end
