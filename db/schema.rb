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

ActiveRecord::Schema.define(version: 2018_08_12_072422) do

  create_table "albums", force: :cascade do |t|
    t.integer "user_id"
    t.index ["user_id"], name: "index_albums_on_user_id"
  end

  create_table "spots", force: :cascade do |t|
    t.integer "album_id"
    t.integer "sticker_id"
    t.integer "sticker_default_id"
    t.index ["album_id"], name: "index_spots_on_album_id"
    t.index ["sticker_default_id"], name: "index_spots_on_sticker_default_id"
    t.index ["sticker_id"], name: "index_spots_on_sticker_id"
  end

  create_table "sticker_defaults", force: :cascade do |t|
    t.string "code", limit: 255, null: false
    t.string "name", limit: 255, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_sticker_defaults_on_code"
    t.index ["name"], name: "index_sticker_defaults_on_name"
  end

  create_table "sticker_packs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "size", default: 3, null: false
    t.integer "status", null: false
    t.datetime "opened_at"
    t.index ["user_id"], name: "index_sticker_packs_on_user_id"
  end

  create_table "stickers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "sticker_default_id"
    t.integer "sticker_pack_id"
    t.integer "spot_id"
    t.index ["spot_id"], name: "index_stickers_on_spot_id"
    t.index ["sticker_default_id"], name: "index_stickers_on_sticker_default_id"
    t.index ["sticker_pack_id"], name: "index_stickers_on_sticker_pack_id"
    t.index ["user_id"], name: "index_stickers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", limit: 100, default: "", null: false
    t.string "username", limit: 20
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username"
  end

end
