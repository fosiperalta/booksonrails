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

ActiveRecord::Schema.define(:version => 20141206193542) do

  create_table "assistances", :force => true do |t|
    t.integer "user_id"
    t.integer "meeting_id"
    t.text    "books"
  end

  create_table "books", :force => true do |t|
    t.string   "title"
    t.string   "author"
    t.string   "isbn10"
    t.string   "isbn13"
    t.string   "publisher"
    t.text     "summary"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "language"
  end

  create_table "exemplars", :force => true do |t|
    t.boolean "shareable"
    t.integer "user_id"
    t.integer "book_id"
  end

  create_table "meetings", :force => true do |t|
    t.string   "title"
    t.datetime "date",       :limit => 255
    t.string   "country"
    t.string   "city"
    t.text     "direction"
    t.string   "creator"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "username"
    t.datetime "login_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "name"
    t.string   "surname"
    t.string   "password"
    t.datetime "birth_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
