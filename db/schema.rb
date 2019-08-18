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

ActiveRecord::Schema.define(version: 2019_08_16_172822) do

  create_table "addresses", force: :cascade do |t|
    t.integer "end_user_id", null: false
    t.string "address", null: false
    t.string "name", null: false
    t.string "postal_code", null: false
    t.string "telephone_number", null: false
    t.boolean "main_flag", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["end_user_id"], name: "index_addresses_on_end_user_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_admin_users_on_email", unique: true
  end

  create_table "artists", force: :cascade do |t|
    t.string "artist_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_name"], name: "index_artists_on_artist_name"
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "end_user_id", null: false
    t.integer "purchase_quantity", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["end_user_id"], name: "index_cart_items_on_end_user_id"
    t.index ["item_id"], name: "index_cart_items_on_item_id"
  end

  create_table "discs", force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "disc_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_discs_on_item_id"
  end

  create_table "end_users", force: :cascade do |t|
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_name_kana", null: false
    t.string "first_name_kana", null: false
    t.boolean "delete_flag", null: false
    t.integer "usually_payment", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_end_users_on_email", unique: true
    t.index ["first_name"], name: "index_end_users_on_first_name"
    t.index ["last_name"], name: "index_end_users_on_last_name"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "end_user_id", null: false
    t.integer "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["end_user_id"], name: "index_favorites_on_end_user_id"
    t.index ["item_id"], name: "index_favorites_on_item_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "genre_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_name"], name: "index_genres_on_genre_name"
  end

  create_table "items", force: :cascade do |t|
    t.integer "artist_id", null: false
    t.integer "genre_id", null: false
    t.integer "label_id", null: false
    t.string "item_name", null: false
    t.string "item_image_id", null: false
    t.integer "price", null: false
    t.integer "stock", null: false
    t.integer "sale_number", null: false
    t.integer "sale_condition", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_items_on_artist_id"
    t.index ["genre_id"], name: "index_items_on_genre_id"
    t.index ["item_name"], name: "index_items_on_item_name"
    t.index ["label_id"], name: "index_items_on_label_id"
  end

  create_table "labels", force: :cascade do |t|
    t.string "label_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["label_name"], name: "index_labels_on_label_name"
  end

  create_table "musics", force: :cascade do |t|
    t.integer "disc_id", null: false
    t.string "music_name", null: false
    t.integer "music_order", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disc_id"], name: "index_musics_on_disc_id"
  end

  create_table "purchase_details", force: :cascade do |t|
    t.integer "purchase_history_id_id", null: false
    t.integer "shipping_status", null: false
    t.integer "sale_number", null: false
    t.integer "price_history", null: false
    t.string "item_name_history", null: false
    t.string "artist_name_history", null: false
    t.string "postal_code_history", null: false
    t.string "address_history", null: false
    t.string "telephone_number_history", null: false
    t.string "name_history", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["purchase_history_id_id"], name: "index_purchase_details_on_purchase_history_id_id"
  end

  create_table "purchase_histories", force: :cascade do |t|
    t.integer "end_user_id", null: false
    t.integer "total_price", null: false
    t.integer "shipping_charge", null: false
    t.integer "consumption_tax", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["end_user_id"], name: "index_purchase_histories_on_end_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "end_user_id", null: false
    t.integer "item_id", null: false
    t.string "review_title", null: false
    t.text "review_body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["end_user_id"], name: "index_reviews_on_end_user_id"
    t.index ["item_id"], name: "index_reviews_on_item_id"
  end

end
