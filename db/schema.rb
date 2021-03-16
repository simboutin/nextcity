# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_13_095657) do

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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "city_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_bookmarks_on_city_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name", null: false
    t.float "latitude"
    t.float "longitude"
    t.text "description"
    t.integer "population"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "geo_shape"
    t.integer "region_code"
    t.string "region_name"
    t.integer "department_code"
    t.string "department_name"
    t.integer "employment_zone_code"
    t.string "employment_zone_name"
    t.integer "epci_code"
    t.string "epci_name"
    t.string "city_code"
    t.string "city_type"
    t.float "flats_rental_price"
    t.float "houses_rental_price"
    t.string "mountain"
    t.boolean "coastline"
    t.string "mayor_last_name"
    t.string "mayor_first_name"
    t.string "mayor_gender"
    t.date "mayor_date_of_birth"
    t.float "ftth_homes_rate"
    t.float "population_0_to_25_years_rate"
    t.float "population_25_to_64_years_rate"
    t.float "population_65_years_and_more_rate"
    t.float "principal_residences_rate"
    t.float "flats_rate"
    t.float "houses_rate"
    t.float "owners_rate"
    t.float "renters_rate"
    t.float "vacant_houses_rate"
    t.float "net_hourly_wage"
    t.float "unemployment_rate"
    t.integer "tourism_structures_number"
  end

  create_table "city_comments", force: :cascade do |t|
    t.text "content"
    t.bigint "city_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_city_comments_on_city_id"
    t.index ["user_id"], name: "index_city_comments_on_user_id"
  end

  create_table "searches", force: :cascade do |t|
    t.string "job_title"
    t.string "city_type"
    t.string "city_size"
    t.string "environment"
    t.string "home_type"
    t.string "home_category"
    t.integer "home_size"
    t.integer "home_budget"
    t.string "cities_result"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_searches_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "bio"
    t.boolean "ambassador", default: false
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookmarks", "cities"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "city_comments", "cities"
  add_foreign_key "city_comments", "users"
  add_foreign_key "searches", "users"
end
