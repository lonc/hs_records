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

ActiveRecord::Schema.define(:version => 20120704200436) do

  create_table "assignments", :force => true do |t|
    t.string   "assignment",        :null => false
    t.binary   "assigned"
    t.date     "date_assigned"
    t.binary   "completed"
    t.date     "date_completed"
    t.decimal  "score"
    t.integer  "subject_id",        :null => false
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.text     "watchfor"
    t.text     "materialsrequired"
    t.integer  "notifyby"
    t.binary   "studentupdate"
  end

  create_table "notes", :force => true do |t|
    t.text     "jot"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "students", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "email"
    t.string   "parent"
    t.string   "phone_h"
    t.string   "phone_c"
    t.string   "phone_w"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.date     "birthdate"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "subjects", :force => true do |t|
    t.string   "name",              :null => false
    t.string   "book_name",         :null => false
    t.integer  "student_id",        :null => false
    t.binary   "graded"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.binary   "studentupdate"
    t.binary   "AssignOnMonday"
    t.binary   "AssignOnTuesday"
    t.binary   "AssignOnWednesday"
    t.binary   "AssignOnThursday"
    t.binary   "AssignOnFriday"
  end

end
