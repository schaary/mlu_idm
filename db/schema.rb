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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141017201244) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "sos_grades", force: true do |t|
    t.string   "abint",       null: false
    t.string   "description", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sos_grades", ["abint", "description"], name: "index_sos_grades_on_abint_and_description", using: :btree
  add_index "sos_grades", ["abint"], name: "index_sos_grades_on_abint", unique: true, using: :btree

  create_table "sos_students", force: true do |t|
    t.integer  "matrikel",      null: false
    t.string   "firstname",     null: false
    t.string   "lastname",      null: false
    t.date     "date_of_birth", null: false
    t.integer  "gender",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sos_students", ["firstname", "lastname", "date_of_birth"], name: "index_sos_students_on_firstname_and_lastname_and_date_of_birth", using: :btree
  add_index "sos_students", ["gender"], name: "index_sos_students_on_gender", using: :btree
  add_index "sos_students", ["matrikel"], name: "index_sos_students_on_matrikel", unique: true, using: :btree

end
