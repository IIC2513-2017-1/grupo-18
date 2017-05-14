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

ActiveRecord::Schema.define(version: 20170514235335) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bet_options", force: :cascade do |t|
    t.string   "description"
    t.float    "percentage"
    t.integer  "bet_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "win"
    t.index ["bet_id"], name: "index_bet_options_on_bet_id", using: :btree
  end

  create_table "bets", force: :cascade do |t|
    t.datetime "execution_date"
    t.string   "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
    t.boolean  "visible"
    t.index ["user_id"], name: "index_bets_on_user_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.string   "content"
    t.integer  "bet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bet_id"], name: "index_comments_on_bet_id", using: :btree
  end

  create_table "friends", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_friends_on_user_id", using: :btree
  end

  create_table "payments", force: :cascade do |t|
    t.float    "amount",       default: 0.0
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "payment_type"
    t.index ["user_id"], name: "index_payments_on_user_id", using: :btree
  end

  create_table "user_bets", force: :cascade do |t|
    t.float    "amount"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "bet_option_id"
    t.index ["bet_option_id"], name: "index_user_bets_on_bet_option_id", using: :btree
    t.index ["user_id"], name: "index_user_bets_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",           limit: 20
    t.string   "email"
    t.string   "confirmation_token"
    t.string   "confirmed_at"
    t.integer  "user_type"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.float    "balance",                       default: 0.0
    t.string   "name"
    t.string   "password_digest"
  end

  add_foreign_key "bet_options", "bets"
  add_foreign_key "bets", "users"
  add_foreign_key "comments", "bets"
  add_foreign_key "friends", "users"
  add_foreign_key "payments", "users"
  add_foreign_key "user_bets", "bet_options"
  add_foreign_key "user_bets", "users"
end
