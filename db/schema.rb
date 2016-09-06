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

ActiveRecord::Schema.define(version: 20160905072058) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "created_by_id"
    t.string   "slug"
    t.string   "type"
    t.string   "name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.integer  "parent_id"
    t.string   "cached_warehouse_name"
    t.datetime "deleted_at"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["company_id"], name: "index_areas_on_company_id", using: :btree
    t.index ["slug"], name: "index_areas_on_slug", using: :btree
  end

  create_table "attachments", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "slug"
    t.string   "asset"
    t.string   "tags"
    t.string   "description"
    t.string   "content_type"
    t.integer  "file_size"
    t.integer  "width"
    t.integer  "height"
    t.integer  "length"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["project_id"], name: "index_attachments_on_project_id", using: :btree
    t.index ["slug"], name: "index_attachments_on_slug", using: :btree
  end

  create_table "bootsy_image_galleries", force: :cascade do |t|
    t.string   "bootsy_resource_type"
    t.integer  "bootsy_resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bootsy_images", force: :cascade do |t|
    t.string   "image_file"
    t.integer  "image_gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "slug"
    t.string   "company_name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "fax"
    t.string   "email"
    t.integer  "client_status_id"
    t.string   "cached_status"
    t.datetime "deleted_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["client_status_id"], name: "index_clients_on_client_status_id", using: :btree
    t.index ["company_id"], name: "index_clients_on_company_id", using: :btree
    t.index ["slug"], name: "index_clients_on_slug", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "ticket_id",                  null: false
    t.integer  "user_id",                    null: false
    t.boolean  "public",     default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["ticket_id"], name: "index_comments_on_ticket_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.integer  "company_status_id"
    t.string   "cached_status"
    t.datetime "deleted_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["company_status_id"], name: "index_companies_on_company_status_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "client_id"
    t.string   "slug"
    t.integer  "proposal_id"
    t.integer  "created_by_id"
    t.integer  "update_by_id"
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "project_status_id"
    t.string   "cached_project_status"
    t.string   "cached_client_name"
    t.datetime "deleted_at"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["client_id"], name: "index_projects_on_client_id", using: :btree
    t.index ["company_id"], name: "index_projects_on_company_id", using: :btree
    t.index ["slug"], name: "index_projects_on_slug", using: :btree
  end

  create_table "proposals", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "project_id"
    t.boolean  "current",                default: true
    t.string   "slug"
    t.string   "type"
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
    t.string   "uuid"
    t.string   "title"
    t.integer  "proposal_status_id"
    t.string   "cached_proposal_status"
    t.datetime "versioned_at"
    t.datetime "deleted_at"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["company_id"], name: "index_proposals_on_company_id", using: :btree
    t.index ["project_id"], name: "index_proposals_on_project_id", using: :btree
    t.index ["slug"], name: "index_proposals_on_slug", using: :btree
  end

  create_table "registries", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "slug"
    t.string   "label"
    t.string   "type"
    t.integer  "position"
    t.integer  "count",      default: 0
    t.datetime "deleted_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["company_id"], name: "index_registries_on_company_id", using: :btree
    t.index ["slug"], name: "index_registries_on_slug", using: :btree
  end

  create_table "sections", force: :cascade do |t|
    t.integer  "proposal_id"
    t.integer  "section_type_id"
    t.string   "slug"
    t.string   "cached_section_type"
    t.string   "header"
    t.text     "data"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["proposal_id"], name: "index_sections_on_proposal_id", using: :btree
    t.index ["section_type_id"], name: "index_sections_on_section_type_id", using: :btree
    t.index ["slug"], name: "index_sections_on_slug", using: :btree
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.string   "slug"
    t.string   "title"
    t.text     "description"
    t.integer  "company_id"
    t.integer  "project_id"
    t.integer  "status",               default: 0
    t.integer  "created_by"
    t.integer  "viewed_by"
    t.integer  "assigned_to"
    t.string   "submitted_by_name"
    t.string   "submitted_by_email"
    t.string   "submitted_by_company"
    t.datetime "deleted_at"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "access_key",                       null: false
    t.index ["company_id"], name: "index_tickets_on_company_id", using: :btree
    t.index ["project_id"], name: "index_tickets_on_project_id", using: :btree
    t.index ["slug"], name: "index_tickets_on_slug", using: :btree
    t.index ["status"], name: "index_tickets_on_status", using: :btree
  end

  create_table "units", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "uuid"
    t.string   "slug"
    t.string   "unit_hash",                                  null: false
    t.string   "qrcode"
    t.string   "procurement_status"
    t.integer  "unit_category_id"
    t.string   "manufacturer"
    t.string   "model"
    t.string   "description"
    t.string   "client_description"
    t.decimal  "cost",               precision: 8, scale: 2
    t.integer  "location_id"
    t.integer  "project_id"
    t.integer  "unit_status_id"
    t.string   "cached_status"
    t.datetime "deleted_at"
    t.datetime "checkin_at"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.index ["company_id"], name: "index_units_on_company_id", using: :btree
    t.index ["location_id"], name: "index_units_on_location_id", using: :btree
    t.index ["manufacturer"], name: "index_units_on_manufacturer", using: :btree
    t.index ["project_id"], name: "index_units_on_project_id", using: :btree
    t.index ["slug"], name: "index_units_on_slug", using: :btree
    t.index ["unit_category_id"], name: "index_units_on_unit_category_id", using: :btree
    t.index ["unit_hash"], name: "index_units_on_unit_hash", using: :btree
    t.index ["unit_status_id"], name: "index_units_on_unit_status_id", using: :btree
  end

  create_table "uploads", force: :cascade do |t|
    t.string   "image"
    t.string   "uploadable_type"
    t.integer  "uploadable_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "slug"
    t.string   "type"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "avatar"
    t.string   "password_digest"
    t.integer  "user_status_id"
    t.string   "cached_status"
    t.boolean  "confirmed",              default: false
    t.string   "confirmation_token"
    t.integer  "security_question_id"
    t.string   "security_answer"
    t.datetime "deleted_at"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.index ["company_id"], name: "index_users_on_company_id", using: :btree
    t.index ["slug"], name: "index_users_on_slug", using: :btree
    t.index ["user_status_id"], name: "index_users_on_user_status_id", using: :btree
  end

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.text     "object_changes"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree
  end

  add_foreign_key "areas", "companies"
  add_foreign_key "attachments", "projects"
  add_foreign_key "clients", "companies"
  add_foreign_key "projects", "clients"
  add_foreign_key "projects", "companies"
  add_foreign_key "proposals", "companies"
  add_foreign_key "proposals", "projects"
  add_foreign_key "sections", "proposals"
  add_foreign_key "units", "companies"
  add_foreign_key "users", "companies"
end
