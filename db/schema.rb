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

ActiveRecord::Schema[7.0].define(version: 2022_04_04_170058) do
  create_table "emi_payments", force: :cascade do |t|
    t.integer "loan_id"
    t.float "paid_emi_amt"
    t.float "emi_amt"
    t.float "principal_amt"
    t.date "paid_date"
    t.float "intrest_amt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "loans", force: :cascade do |t|
    t.float "loan_amt"
    t.float "monthly_emi"
    t.integer "total_loan_period"
    t.float "total_payment"
    t.date "monthly_payment_date"
    t.boolean "monthly_emi_changable"
    t.integer "total_paid_period"
    t.float "total_paid_amt"
    t.float "total_paid_principal"
    t.float "totalr_paid_intrest"
    t.float "remaining_total_amt"
    t.float "remaining_principlal_amt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
