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

ActiveRecord::Schema.define(version: 2018_11_20_203122) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string "q5"
    t.string "q6"
    t.bigint "review_id"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "q7"
    t.integer "q8"
    t.integer "q9"
    t.integer "q10"
    t.integer "q11"
    t.integer "q12"
    t.integer "q13"
    t.integer "q14"
    t.integer "q15"
    t.integer "q16"
    t.integer "q17"
    t.integer "q18"
    t.integer "q19"
    t.integer "q20"
    t.integer "q21"
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
    t.bigint "review_id"
    t.index ["review_id"], name: "index_destinations_on_review_id"
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
    t.integer "number"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "street_review_content"
    t.text "commune_review_content"
    t.string "street_review_title"
    t.string "commune_review_title"
    t.integer "street_review_average_rating"
    t.integer "commune_review_average_rating"
    t.float "latitude"
    t.float "longitude"
    t.integer "no_likes"
    t.bigint "user_id"
    t.bigint "commune_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "search_id"
    t.string "address"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "query"
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

  create_table "votes", id: :serial, force: :cascade do |t|
    t.string "votable_type"
    t.integer "votable_id"
    t.string "voter_type"
    t.integer "voter_id"
    t.boolean "vote_flag"
    t.string "vote_scope"
    t.integer "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "reviews"
  add_foreign_key "destinations", "reviews"
  add_foreign_key "pictures", "reviews"
  add_foreign_key "reviews", "communes"
  add_foreign_key "reviews", "searches"
  add_foreign_key "reviews", "users"
  add_foreign_key "searches", "users"
end
