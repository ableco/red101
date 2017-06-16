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

ActiveRecord::Schema.define(version: 20160917184008) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", id: :serial, force: :cascade do |t|
    t.integer "diagnostic_id", null: false
    t.integer "question_id", null: false
    t.integer "option_id"
    t.string "option_content"
    t.boolean "option_correct", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diagnostic_id"], name: "index_answers_on_diagnostic_id"
    t.index ["option_content"], name: "index_answers_on_option_content"
    t.index ["option_correct"], name: "index_answers_on_option_correct"
    t.index ["option_id"], name: "index_answers_on_option_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "devices", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "kind", default: 0, null: false
    t.string "token", null: false
    t.datetime "expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.index ["expires_at"], name: "index_devices_on_expires_at"
    t.index ["kind"], name: "index_devices_on_kind"
    t.index ["token"], name: "index_devices_on_token", unique: true
    t.index ["user_id"], name: "index_devices_on_user_id"
  end

  create_table "diagnostics", id: :serial, force: :cascade do |t|
    t.integer "template_id", null: false
    t.integer "user_id"
    t.datetime "finished_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "answers_count", default: 0, null: false
    t.string "reference"
    t.index ["finished_at"], name: "index_diagnostics_on_finished_at"
    t.index ["template_id"], name: "index_diagnostics_on_template_id"
    t.index ["user_id"], name: "index_diagnostics_on_user_id"
  end

  create_table "materials", id: :serial, force: :cascade do |t|
    t.integer "topic_id", null: false
    t.string "title", null: false
    t.string "url", null: false
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug", null: false
    t.integer "visits_count", default: 0
    t.index ["description"], name: "index_materials_on_description"
    t.index ["title"], name: "index_materials_on_title"
    t.index ["topic_id"], name: "index_materials_on_topic_id"
    t.index ["url"], name: "index_materials_on_url"
  end

  create_table "options", id: :serial, force: :cascade do |t|
    t.integer "question_id", null: false
    t.string "content", null: false
    t.boolean "correct", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "explanation"
    t.index ["content"], name: "index_options_on_content"
    t.index ["correct"], name: "index_options_on_correct"
    t.index ["question_id"], name: "index_options_on_question_id"
  end

  create_table "questions", id: :serial, force: :cascade do |t|
    t.integer "topic_id", null: false
    t.string "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content"], name: "index_questions_on_content"
    t.index ["topic_id"], name: "index_questions_on_topic_id"
  end

  create_table "references", id: :serial, force: :cascade do |t|
    t.integer "topic_id", null: false
    t.integer "template_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["template_id"], name: "index_references_on_template_id"
    t.index ["topic_id", "template_id"], name: "index_references_on_topic_id_and_template_id", unique: true
    t.index ["topic_id"], name: "index_references_on_topic_id"
  end

  create_table "templates", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "question_limit", default: 1, null: false
    t.string "description"
    t.index ["name"], name: "index_templates_on_name"
  end

  create_table "topics", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.string "info", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.index ["info"], name: "index_topics_on_info"
    t.index ["name"], name: "index_topics_on_name", unique: true
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.boolean "admin", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.index ["admin"], name: "index_users_on_admin"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "visits", id: :serial, force: :cascade do |t|
    t.integer "material_id", null: false
    t.integer "user_id"
    t.string "referer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["material_id"], name: "index_visits_on_material_id"
    t.index ["referer"], name: "index_visits_on_referer"
    t.index ["user_id"], name: "index_visits_on_user_id"
  end

end
