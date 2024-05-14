# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_04_11_165838) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_categories_on_title", unique: true
  end

  create_table "forums", force: :cascade do |t|
    t.string "title", null: false
    t.bigint "parent_id"
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_forums_on_category_id"
    t.index ["parent_id"], name: "index_forums_on_parent_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "topic_id", null: false
    t.bigint "created_by_id", null: false
    t.bigint "updated_by_id", null: false
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_posts_on_created_by_id"
    t.index ["topic_id"], name: "index_posts_on_topic_id"
    t.index ["updated_by_id"], name: "index_posts_on_updated_by_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "title", null: false
    t.integer "views", default: 0, null: false
    t.bigint "forum_id", null: false
    t.bigint "created_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_topics_on_created_by_id"
    t.index ["forum_id"], name: "index_topics_on_forum_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "username", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "avatar_url"
    t.string "signature"
    t.integer "gold", default: 0, null: false
    t.string "theme", default: "light", null: false
    t.integer "topics_per_page", default: 50, null: false
    t.integer "posts_per_page", default: 20, null: false
    t.integer "posts_count", default: 0
    t.integer "topics_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
    t.check_constraint "gold >= 0"
  end

  add_foreign_key "forums", "categories"
  add_foreign_key "forums", "forums", column: "parent_id"
  add_foreign_key "posts", "topics"
  add_foreign_key "posts", "users", column: "created_by_id"
  add_foreign_key "posts", "users", column: "updated_by_id"
  add_foreign_key "topics", "forums"
  add_foreign_key "topics", "users", column: "created_by_id"
end
