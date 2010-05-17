# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090218154326) do

  create_table "catalogues", :force => true do |t|
    t.text     "name",       :null => false
    t.text     "info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "catalogues", ["name"], :name => "catalogues_name_u", :unique => true

  create_table "item_periods", :force => true do |t|
    t.date     "start_date", :null => false
    t.date     "end_date"
    t.float    "price",      :null => false
    t.integer  "item_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_storages", :force => true do |t|
    t.integer  "quantity",   :null => false
    t.integer  "storage_id", :null => false
    t.integer  "item_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "item_storages", ["item_id", "storage_id"], :name => "item_storages_storage_id_item_id_u", :unique => true

  create_table "items", :force => true do |t|
    t.text     "name",         :null => false
    t.float    "size_x"
    t.float    "size_y"
    t.float    "size_z"
    t.float    "weight"
    t.text     "prms"
    t.integer  "catalogue_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "providers", :force => true do |t|
    t.text     "name",                         :null => false
    t.text     "address",                      :null => false
    t.float    "ratio",      :default => 50.0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "providings", :force => true do |t|
    t.date     "providing_date", :null => false
    t.integer  "quantity",       :null => false
    t.float    "price",          :null => false
    t.text     "contract",       :null => false
    t.integer  "provider_id",    :null => false
    t.integer  "item_id",        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rocks", :force => true do |t|
    t.string "rockname", :limit => 20
  end

  create_table "storages", :force => true do |t|
    t.text     "name"
    t.text     "info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "storages", ["name"], :name => "storages_name_u", :unique => true

end
