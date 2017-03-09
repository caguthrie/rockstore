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

ActiveRecord::Schema.define(version: 20170309182645) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audio_clips", force: :cascade do |t|
    t.string   "title"
    t.binary   "clip"
    t.integer  "color"
    t.date     "clip_date"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "clip_file_name"
    t.string   "clip_content_type"
    t.integer  "clip_file_size"
    t.datetime "clip_updated_at"
  end

  create_table "audio_histories", force: :cascade do |t|
    t.integer  "audio_clip_id"
    t.macaddr  "mac_address"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
