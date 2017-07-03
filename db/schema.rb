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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170512054051) do

  create_table "annotations", force: :cascade do |t|
    t.integer  "x_tl",             limit: 4
    t.integer  "y_tl",             limit: 4
    t.integer  "width",            limit: 4
    t.integer  "height",           limit: 4
    t.integer  "page_id",          limit: 4
    t.integer  "transcription_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "date_time_id",     limit: 255
    t.integer  "field_group_id",   limit: 4
    t.datetime "observation_date"
  end

  create_table "content_images", force: :cascade do |t|
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.string   "name",               limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "data_entries", force: :cascade do |t|
    t.string  "value",             limit: 255
    t.string  "data_type",         limit: 255
    t.integer "user_id",           limit: 4
    t.integer "page_id",           limit: 4
    t.integer "annotation_id",     limit: 4
    t.integer "field_id",          limit: 4
    t.string  "field_options_ids", limit: 255
  end

  create_table "field_groups", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "description",   limit: 255
    t.string   "help",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "display_name",  limit: 255
    t.string   "colour_class",  limit: 255, default: "", null: false
    t.string   "internal_name", limit: 255
  end

  create_table "field_groups_fields", force: :cascade do |t|
    t.integer "field_group_id", limit: 4, null: false
    t.integer "field_id",       limit: 4, null: false
    t.integer "sort_order",     limit: 4, null: false
  end

  add_index "field_groups_fields", ["field_group_id"], name: "index_field_groups_fields_on_field_group_id", using: :btree
  add_index "field_groups_fields", ["field_id"], name: "index_field_groups_fields_on_field_id", using: :btree

  create_table "field_options", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.text     "help",               limit: 65535
    t.string   "value",              limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "text_symbol",        limit: 255
    t.string   "display_attribute",  limit: 255,   default: "name"
    t.string   "internal_name",      limit: 255
  end

  create_table "field_options_fields", force: :cascade do |t|
    t.integer "field_option_id", limit: 4, null: false
    t.integer "field_id",        limit: 4, null: false
    t.integer "sort_order",      limit: 4
  end

  add_index "field_options_fields", ["field_id"], name: "index_field_options_fields_on_field_id", using: :btree
  add_index "field_options_fields", ["field_option_id"], name: "index_field_options_fields_on_field_option_id", using: :btree

  create_table "fields", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "field_key",       limit: 255
    t.string   "html_field_type", limit: 255
    t.string   "data_type",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "full_name",       limit: 255
    t.text     "help",            limit: 65535
    t.boolean  "multi_select",                  default: false
    t.string   "internal_name",   limit: 255
  end

  create_table "ledgers", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.string   "ledger_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "page_days", force: :cascade do |t|
    t.date    "date"
    t.integer "num_observations", limit: 4
    t.integer "page_id",          limit: 4
    t.integer "user_id",          limit: 4
  end

  create_table "page_types", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.string   "ledger_type", limit: 255
    t.integer  "number",      limit: 4
    t.text     "description", limit: 65535
    t.integer  "ledger_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "visible",                   default: false
  end

  create_table "page_types_field_groups", force: :cascade do |t|
    t.integer "page_type_id",   limit: 4, null: false
    t.integer "field_group_id", limit: 4, null: false
    t.integer "sort_order",     limit: 4, null: false
  end

  add_index "page_types_field_groups", ["field_group_id"], name: "index_page_types_field_groups_on_field_group_id", using: :btree
  add_index "page_types_field_groups", ["page_type_id"], name: "index_page_types_field_groups_on_page_type_id", using: :btree

  create_table "pages", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.integer  "height",             limit: 4
    t.integer  "width",              limit: 4
    t.integer  "page_type_id",       limit: 4
    t.boolean  "done",                           default: false, null: false
    t.string   "accession_number",   limit: 255
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.string   "volume",             limit: 255
    t.boolean  "visible",                        default: true
  end

  add_index "pages", ["page_type_id"], name: "index_pages_on_page_type_id", using: :btree

  create_table "static_page_translations", force: :cascade do |t|
    t.integer  "static_page_id",   limit: 4,     null: false
    t.string   "locale",           limit: 255,   null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "title",            limit: 255
    t.text     "body",             limit: 65535
    t.string   "slug",             limit: 255
    t.string   "meta_keywords",    limit: 255
    t.string   "meta_title",       limit: 255
    t.string   "meta_description", limit: 255
  end

  add_index "static_page_translations", ["locale"], name: "index_static_page_translations_on_locale", using: :btree
  add_index "static_page_translations", ["static_page_id"], name: "index_static_page_translations_on_static_page_id", using: :btree

  create_table "static_pages", force: :cascade do |t|
    t.boolean  "show_in_header",              default: false, null: false
    t.boolean  "show_in_sidebar",             default: false, null: false
    t.boolean  "visible",                     default: true,  null: false
    t.string   "foreign_link",    limit: 255
    t.integer  "position",        limit: 4,   default: 1,     null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.boolean  "title_as_header",             default: true
  end

  create_table "transcriptions", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "page_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "complete",             default: false, null: false
  end

  create_table "translations", force: :cascade do |t|
    t.string   "locale",         limit: 255
    t.string   "key",            limit: 255
    t.text     "value",          limit: 65535
    t.text     "interpolations", limit: 65535
    t.boolean  "is_proc",                      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "stale",                        default: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "",    null: false
    t.string   "encrypted_password",     limit: 255,   default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "display_name",           limit: 255
    t.boolean  "admin"
    t.text     "bio",                    limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name",       limit: 255
    t.string   "avatar_content_type",    limit: 255
    t.integer  "avatar_file_size",       limit: 4
    t.datetime "avatar_updated_at"
    t.boolean  "dismissed_box_tutorial",               default: false, null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
