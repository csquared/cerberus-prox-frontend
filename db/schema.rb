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

ActiveRecord::Schema.define(:version => 0) do

  create_table "access_group", :force => true do |t|
    t.string "name", :null => false
  end

  add_index "access_group", ["name"], :name => "name"

  create_table "access_log", :force => true do |t|
    t.datetime "logged",                :null => false
    t.string   "card_id", :limit => 50
    t.string   "door",    :limit => 50
    t.string   "action",  :limit => 0
    t.string   "detail"
  end

  add_index "access_log", ["logged", "card_id"], :name => "logged"

  create_table "card", :primary_key => "card_id", :force => true do |t|
    t.string   "user",                     :null => false
    t.string   "nick"
    t.string   "after_hours", :limit => 0, :null => false
    t.datetime "expires",                  :null => false
    t.datetime "valid_from",               :null => false
    t.string   "disabled",    :limit => 0, :null => false
    t.string   "magic",       :limit => 0, :null => false
  end

  create_table "card_group", :force => true do |t|
    t.string  "card_id",         :limit => 50, :null => false
    t.integer "access_group_id",               :null => false
  end

  create_table "door", :force => true do |t|
    t.string "name",             :limit => 50, :null => false
    t.string "default_unlocked", :limit => 0,  :null => false
  end

  create_table "door_access", :force => true do |t|
    t.integer "door_id",         :null => false
    t.integer "access_group_id", :null => false
  end

  add_index "door", ["name"], :name => "name", :unique => true

  add_index "door_access", ["access_group_id"], :name => "access_group_id"
  add_index "door_access", ["door_id"], :name => "door_id"

end
