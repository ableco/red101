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

ActiveRecord::Schema.define(version: 20160811204722) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.integer  "diagnostic_id",                  null: false
    t.integer  "question_id",                    null: false
    t.integer  "option_id"
    t.string   "option_content"
    t.boolean  "option_correct", default: false, null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["diagnostic_id"], name: "index_answers_on_diagnostic_id", using: :btree
    t.index ["option_content"], name: "index_answers_on_option_content", using: :btree
    t.index ["option_correct"], name: "index_answers_on_option_correct", using: :btree
    t.index ["option_id"], name: "index_answers_on_option_id", using: :btree
    t.index ["question_id"], name: "index_answers_on_question_id", using: :btree
  end

  create_table "devices", force: :cascade do |t|
    t.integer  "user_id",                 null: false
    t.integer  "kind",        default: 0, null: false
    t.string   "description",             null: false
    t.string   "token",                   null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["description"], name: "index_devices_on_description", using: :btree
    t.index ["kind"], name: "index_devices_on_kind", using: :btree
    t.index ["token"], name: "index_devices_on_token", unique: true, using: :btree
    t.index ["user_id"], name: "index_devices_on_user_id", using: :btree
  end

  create_table "diagnostics", force: :cascade do |t|
    t.integer  "template_id", null: false
    t.integer  "user_id",     null: false
    t.datetime "finished_at"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["finished_at"], name: "index_diagnostics_on_finished_at", using: :btree
    t.index ["template_id"], name: "index_diagnostics_on_template_id", using: :btree
    t.index ["user_id"], name: "index_diagnostics_on_user_id", using: :btree
  end

  create_table "materials", force: :cascade do |t|
    t.integer  "topic_id",   null: false
    t.string   "title",      null: false
    t.string   "url",        null: false
    t.string   "details",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["details"], name: "index_materials_on_details", using: :btree
    t.index ["title"], name: "index_materials_on_title", using: :btree
    t.index ["topic_id"], name: "index_materials_on_topic_id", using: :btree
    t.index ["url"], name: "index_materials_on_url", using: :btree
  end

  create_table "options", force: :cascade do |t|
    t.integer  "question_id",                 null: false
    t.string   "content",                     null: false
    t.boolean  "correct",     default: false, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["content"], name: "index_options_on_content", using: :btree
    t.index ["correct"], name: "index_options_on_correct", using: :btree
    t.index ["question_id"], name: "index_options_on_question_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "topic_id",   null: false
    t.string   "content",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content"], name: "index_questions_on_content", using: :btree
    t.index ["topic_id"], name: "index_questions_on_topic_id", using: :btree
  end

  create_table "references", force: :cascade do |t|
    t.integer  "topic_id",    null: false
    t.integer  "template_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["template_id"], name: "index_references_on_template_id", using: :btree
    t.index ["topic_id", "template_id"], name: "index_references_on_topic_id_and_template_id", unique: true, using: :btree
    t.index ["topic_id"], name: "index_references_on_topic_id", using: :btree
  end

  create_table "templates", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_templates_on_name", using: :btree
  end

  create_table "topics", force: :cascade do |t|
    t.string   "name",                    null: false
    t.string   "info",       default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["info"], name: "index_topics_on_info", using: :btree
    t.index ["name"], name: "index_topics_on_name", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",                      null: false
    t.string   "last_name",                       null: false
    t.string   "phone"
    t.string   "level"
    t.string   "location"
    t.string   "school"
    t.string   "role"
    t.string   "since"
    t.string   "about"
    t.string   "email",                           null: false
    t.string   "password_digest",                 null: false
    t.boolean  "admin",           default: false, null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["about"], name: "index_users_on_about", using: :btree
    t.index ["admin"], name: "index_users_on_admin", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["first_name"], name: "index_users_on_first_name", using: :btree
    t.index ["last_name"], name: "index_users_on_last_name", using: :btree
    t.index ["level"], name: "index_users_on_level", using: :btree
    t.index ["location"], name: "index_users_on_location", using: :btree
    t.index ["phone"], name: "index_users_on_phone", using: :btree
    t.index ["role"], name: "index_users_on_role", using: :btree
    t.index ["school"], name: "index_users_on_school", using: :btree
    t.index ["since"], name: "index_users_on_since", using: :btree
  end

end
