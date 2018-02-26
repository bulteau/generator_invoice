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

ActiveRecord::Schema.define(version: 20180225234828) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "invoices", force: :cascade do |t|
    t.float "contract_monthly_rent"
    t.float "insurance_excl_tax"
    t.float "insurance_vat"
    t.float "insurance_incl_tax"
    t.float "broker_excl_tax"
    t.float "broker_vat"
    t.float "broker_incl_tax"
    t.float "garantme_excl_tax"
    t.float "garantme_vat"
    t.float "garantme_incl_tax"
    t.float "subtotal_excl_tax"
    t.float "subtotal_vat"
    t.float "subtotal_incl_tax"
    t.float "discount_excl_tax"
    t.float "discount_vat"
    t.float "discount_incl_tax"
    t.float "total_invoice_excl_tax"
    t.float "total_invoice_vat"
    t.float "total_invoice_incl_tax"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
