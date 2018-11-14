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

ActiveRecord::Schema.define(version: 2018_11_13_185736) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.integer "answer_range"
    t.string "answer_text"
    t.bigint "review_id"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["review_id"], name: "index_answers_on_review_id"
  end

  create_table "communes", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "destinations", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
  end

  create_table "pictures", force: :cascade do |t|
    t.string "url"
    t.bigint "review_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_pictures_on_review_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title"
    t.string "category"
    t.string "answer_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.text "street_review_content"
    t.text "commune_review_content"
    t.string "street_review_title"
    t.string "commune_review_title"
    t.integer "street_review_average_rating"
    t.integer "commune_review_average_rating"
    t.float "latitude_review"
    t.float "longitude_review"
    t.integer "no_likes"
    t.bigint "user_id"
    t.bigint "commune_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "search_id"
    t.index ["commune_id"], name: "index_reviews_on_commune_id"
    t.index ["search_id"], name: "index_reviews_on_search_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "searches", force: :cascade do |t|
    t.string "address"
    t.integer "radius"
    t.float "latitude"
    t.float "longitude"
    t.bigint "user_id"
    t.bigint "commune_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commune_id"], name: "index_searches_on_commune_id"
    t.index ["user_id"], name: "index_searches_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "f_name"
    t.string "l_name"
    t.string "photo"
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "reviews"
  add_foreign_key "pictures", "reviews"
  add_foreign_key "reviews", "communes"
  add_foreign_key "reviews", "searches"
  add_foreign_key "reviews", "users"
  add_foreign_key "searches", "communes"
  add_foreign_key "searches", "users"
end
