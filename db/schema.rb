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

ActiveRecord::Schema.define(:version => 20130622050214) do

  create_table "affiliates", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lead_sales", :force => true do |t|
    t.decimal  "price"
    t.integer  "student_id"
    t.integer  "affiliate_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "lead_sales", ["affiliate_id"], :name => "index_lead_sales_on_affiliate_id"
  add_index "lead_sales", ["student_id"], :name => "index_lead_sales_on_student_id"

  create_table "leads", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.boolean  "opt_in"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "students", :force => true do |t|
    t.integer  "age_range"
    t.string   "sex"
    t.string   "nationality"
    t.integer  "psycho_demographic"
    t.boolean  "employed"
    t.boolean  "student"
    t.integer  "education_level"
    t.integer  "education_aos"
    t.integer  "income_level"
    t.string   "enrollment"
    t.string   "page_pass"
    t.string   "page_ver"
    t.integer  "lead_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "students", ["lead_id"], :name => "index_students_on_lead_id"

end
