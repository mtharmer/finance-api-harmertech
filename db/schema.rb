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

ActiveRecord::Schema[7.1].define(version: 2025_06_25_190952) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "debts", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "user_id", null: false
    t.decimal "original_balance", precision: 10, scale: 2, null: false
    t.decimal "current_balance", precision: 10, scale: 2
    t.decimal "apr", precision: 6, scale: 3, default: "0.0", null: false
    t.integer "original_term", null: false
    t.decimal "minimum_payment", precision: 10, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "original_interest", precision: 10, scale: 2
    t.decimal "remaining_interest", precision: 10, scale: 2
    t.integer "remaining_term"
    t.decimal "principal_paid", precision: 10, scale: 2
    t.index ["user_id"], name: "index_debts_on_user_id"
  end

  create_table "monthly_expenses", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "amount", precision: 10, scale: 2, null: false
    t.string "expense_type"
    t.integer "due_day"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_monthly_expenses_on_user_id"
  end

  create_table "mortgages", force: :cascade do |t|
    t.decimal "original_balance", precision: 10, scale: 2
    t.decimal "current_balance", precision: 10, scale: 2
    t.decimal "apr", precision: 6, scale: 3, default: "0.0"
    t.integer "term"
    t.decimal "payment", precision: 10, scale: 2
    t.decimal "tax", precision: 10, scale: 2, default: "0.0"
    t.decimal "insurance", precision: 10, scale: 2, default: "0.0"
    t.decimal "pmi", precision: 10, scale: 2, default: "0.0"
    t.decimal "extra_payment", precision: 10, scale: 2, default: "0.0"
    t.decimal "original_interest", precision: 10, scale: 2
    t.decimal "remaining_interest", precision: 10, scale: 2
    t.integer "remaining_term"
    t.decimal "original_interest_after_extra", precision: 10, scale: 2
    t.decimal "remaining_interest_after_extra", precision: 10, scale: 2
    t.integer "remaining_term_after_extra"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "down_payment", precision: 10, scale: 2, default: "0.0"
    t.decimal "original_balance_after_down_payment", precision: 10, scale: 2
    t.index ["user_id"], name: "index_mortgages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "debts", "users"
  add_foreign_key "monthly_expenses", "users"
  add_foreign_key "mortgages", "users"
end
