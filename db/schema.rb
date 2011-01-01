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

ActiveRecord::Schema.define(:version => 20110101065914) do

  create_table "demo_host_settings", :force => true do |t|
    t.string   "key"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "demo_site_urls", :force => true do |t|
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "galleries", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.integer  "gallery_id"
    t.string   "title"
    t.text     "body"
    t.text     "photo_url"
    t.boolean  "publish"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "webpage_id"
  end

  create_table "publishers", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "webpages", :force => true do |t|
    t.integer  "publisher_id"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
