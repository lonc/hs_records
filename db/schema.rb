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

ActiveRecord::Schema.define(:version => 20120912025548) do

  create_table "assignments", :force => true do |t|
    t.string   "assignment",                           :null => false
    t.date     "date_assigned"
    t.decimal  "score"
    t.integer  "subject_id",                           :null => false
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.text     "watchfor"
    t.text     "materialsrequired"
    t.date     "notify_by"
    t.boolean  "assigned",          :default => false
    t.boolean  "studentupdate"
  end

  create_table "notes", :force => true do |t|
    t.text     "jot"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "resources", :force => true do |t|
    t.string   "title",         :null => false
    t.string   "Publisher"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "NumberOfPages"
    t.integer  "subject_id"
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
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.binary   "studentupdate"
    t.binary   "AssignOnMonday"
    t.binary   "AssignOnTuesday"
    t.binary   "AssignOnWednesday"
    t.binary   "AssignOnThursday"
    t.binary   "AssignOnFriday"
    t.integer  "student_id"
    t.text     "nickname"
    t.integer  "base_id"
    t.integer  "priority"
    t.boolean  "graded"
    t.boolean  "repeating"
  end

end
