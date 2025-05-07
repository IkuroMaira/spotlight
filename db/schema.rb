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

ActiveRecord::Schema[8.0].define(version: 2025_05_07_084739) do
  create_table "impact_categories", force: :cascade do |t|
    t.string "name", limit: 50
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "user_id"], name: "index_impact_categories_on_name_and_user_id", unique: true
    t.index ["user_id"], name: "index_impact_categories_on_user_id"
  end

  create_table "spots", force: :cascade do |t|
    t.string "name", limit: 50
    t.float "longitude"
    t.float "latitude"
    t.integer "impact_category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spots_tags", force: :cascade do |t|
    t.integer "spot_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spot_id", "tag_id"], name: "index_spots_tags_on_spot_id_and_tag_id", unique: true
    t.index ["spot_id"], name: "index_spots_tags_on_spot_id"
    t.index ["tag_id"], name: "index_spots_tags_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", limit: 50
    t.string "color", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", limit: 100
    t.string "password", limit: 72
    t.string "pseudo", limit: 30
    t.string "city", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["pseudo"], name: "index_users_on_pseudo", unique: true
  end

  create_table "users_spots", force: :cascade do |t|
    t.integer "spot_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spot_id", "user_id"], name: "index_users_spots_on_spot_id_and_user_id", unique: true
    t.index ["spot_id"], name: "index_users_spots_on_spot_id"
    t.index ["user_id"], name: "index_users_spots_on_user_id"
  end

  add_foreign_key "impact_categories", "users"
  add_foreign_key "spots_tags", "spots"
  add_foreign_key "spots_tags", "tags"
  add_foreign_key "users_spots", "spots"
  add_foreign_key "users_spots", "users"
end
