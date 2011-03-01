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

ActiveRecord::Schema.define(:version => 20110212201246) do

  create_table "items", :force => true do |t|
    t.string   "name"
    t.string   "boss"
    t.integer  "itemid"
    t.integer  "heroicid"
    t.boolean  "heroic"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["name"], :name => "index_items_on_name"

  create_table "members", :force => true do |t|
    t.string  "name"
    t.integer "position", :default => 0
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
