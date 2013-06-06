# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130531213726) do

  create_table "clients", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email_address"
    t.string   "phone"
    t.integer  "highest_level_of_education"
    t.string   "enroll"
    t.integer  "company_id"
    t.integer  "lead_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "clients", ["lead_id"], :name => "index_clients_on_lead_id"

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "product_name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "leads", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "address"
    t.decimal  "total"
    t.decimal  "success"
    t.integer  "company_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "leads", ["company_id"], :name => "index_leads_on_company_id"

end
