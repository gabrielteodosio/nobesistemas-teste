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

ActiveRecord::Schema[7.0].define(version: 2022_08_25_060157) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "balances", force: :cascade do |t|
    t.float "amount", default: 0.0
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_balances_on_user_id"
  end

  create_table "deposits", force: :cascade do |t|
    t.float "amount", default: 0.0, null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_deposits_on_user_id"
  end

  create_table "statement_deposits", id: false, force: :cascade do |t|
    t.bigint "statement_id"
    t.bigint "deposit_id"
    t.index ["deposit_id"], name: "index_statement_deposits_on_deposit_id"
    t.index ["statement_id"], name: "index_statement_deposits_on_statement_id"
  end

  create_table "statement_transactions", id: false, force: :cascade do |t|
    t.bigint "statement_id"
    t.bigint "transaction_id"
    t.index ["statement_id"], name: "index_statement_transactions_on_statement_id"
    t.index ["transaction_id"], name: "index_statement_transactions_on_transaction_id"
  end

  create_table "statement_withdraws", id: false, force: :cascade do |t|
    t.bigint "statement_id"
    t.bigint "withdraw_id"
    t.index ["statement_id"], name: "index_statement_withdraws_on_statement_id"
    t.index ["withdraw_id"], name: "index_statement_withdraws_on_withdraw_id"
  end

  create_table "statements", force: :cascade do |t|
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_statements_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.float "amount", default: 0.0, null: false
    t.bigint "sender_id"
    t.bigint "receiver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username", default: ""
    t.string "first_name", default: ""
    t.string "last_name", default: ""
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "withdraws", force: :cascade do |t|
    t.float "amount", default: 0.0, null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_withdraws_on_user_id"
  end

end
