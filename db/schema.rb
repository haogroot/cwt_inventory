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

ActiveRecord::Schema.define(version: 20151011052825) do

  create_table "assigned_projects", id: false, force: :cascade do |t|
    t.integer "UserID",     limit: 4, null: false
    t.integer "projectsID", limit: 4, null: false
  end

  add_index "assigned_projects", ["UserID"], name: "Assigned_Project_FKIndex1", using: :btree
  add_index "assigned_projects", ["projectsID"], name: "Assigned_Project_FKIndex2", using: :btree

  create_table "borrow_logs", force: :cascade do |t|
    t.text     "log",          limit: 65535
    t.integer  "user_info_id", limit: 4
    t.integer  "item_id",      limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "borrow_logs", ["item_id"], name: "index_borrow_logs_on_item_id", using: :btree
  add_index "borrow_logs", ["user_info_id"], name: "index_borrow_logs_on_user_info_id", using: :btree

  create_table "borrow_return_logs", primary_key: "ID", force: :cascade do |t|
    t.integer  "UserID",        limit: 4,   null: false
    t.integer  "ItemID",        limit: 4,   null: false
    t.datetime "Creation_Time",             null: false
    t.integer  "StatusID",      limit: 4,   null: false
    t.string   "Observations",  limit: 255
  end

  add_index "borrow_return_logs", ["ItemID"], name: "Borrow_Return_Logs_FKIndex2", using: :btree
  add_index "borrow_return_logs", ["StatusID"], name: "Borrow_Return_Logs_FKIndex3", using: :btree
  add_index "borrow_return_logs", ["UserID"], name: "Borrow_Return_Logs_FKIndex1", using: :btree

  create_table "item_contents", primary_key: "ID", force: :cascade do |t|
    t.integer  "Item_ID",       limit: 4,     null: false
    t.string   "Name",          limit: 255
    t.string   "Name_Chinese",  limit: 255
    t.integer  "Quantity",      limit: 4
    t.integer  "Status_2",      limit: 4
    t.datetime "Creation_Time"
    t.boolean  "Is_Deleted",    limit: 1
    t.text     "Description",   limit: 65535
  end

  add_index "item_contents", ["Item_ID"], name: "item_contents_FKIndex1", using: :btree

  create_table "item_situations", force: :cascade do |t|
    t.text     "situation",  limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "items", primary_key: "ID", force: :cascade do |t|
    t.string   "BarcodeID",         limit: 255
    t.string   "AnotherID",         limit: 255
    t.string   "Name",              limit: 255
    t.string   "Name_Chinese",      limit: 255
    t.datetime "Creation_Time",                                   null: false
    t.integer  "_Status",           limit: 4
    t.integer  "Assigned_To",       limit: 4
    t.integer  "locations",         limit: 4
    t.integer  "Source_project",    limit: 4
    t.integer  "Created_by",        limit: 4
    t.integer  "Bought_By",         limit: 4
    t.integer  "_Type",             limit: 4
    t.datetime "Bought_Date"
    t.datetime "Modification_Time"
    t.integer  "Modified_By",       limit: 4
    t.boolean  "Is_Deleted",        limit: 1,     default: false, null: false
    t.integer  "Quantity",          limit: 4,     default: 1
    t.text     "Description",       limit: 65535
    t.integer  "ReceiptID",         limit: 4
  end

  add_index "items", ["Assigned_To"], name: "Items_FKIndex1", using: :btree
  add_index "items", ["Bought_By"], name: "Items_FKIndex2", using: :btree
  add_index "items", ["Created_by"], name: "Created_by", using: :btree
  add_index "items", ["Modified_By"], name: "Items_FKIndex3", using: :btree
  add_index "items", ["ReceiptID"], name: "Items_FKIndex8", using: :btree
  add_index "items", ["Source_project"], name: "Items_FKIndex7", using: :btree
  add_index "items", ["_Status"], name: "Items_FKIndex4", using: :btree
  add_index "items", ["_Type"], name: "Items_FKIndex6", using: :btree
  add_index "items", ["locations"], name: "Items_FKIndex5", using: :btree

  create_table "items_borrow_status", primary_key: "ID", force: :cascade do |t|
    t.string   "Status_name",   limit: 255,                 null: false
    t.datetime "Creation_Time",                             null: false
    t.boolean  "Is_Deleted",    limit: 1,   default: false, null: false
  end

  create_table "items_types", primary_key: "ID", force: :cascade do |t|
    t.string   "Type_Name",     limit: 50,                 null: false
    t.datetime "Creation_Time",                            null: false
    t.boolean  "Is_Deleted",    limit: 1,  default: false, null: false
  end

  add_index "items_types", ["Type_Name"], name: "Type_Name", unique: true, using: :btree

  create_table "locations", primary_key: "ID", force: :cascade do |t|
    t.string   "locations_Name", limit: 255,                 null: false
    t.datetime "Creation_Time",                              null: false
    t.boolean  "Is_Deleted",     limit: 1,   default: false, null: false
  end

  create_table "projects", primary_key: "ID", force: :cascade do |t|
    t.string   "projects_Name", limit: 255,                 null: false
    t.datetime "Creation_Time",                             null: false
    t.boolean  "Is_Deleted",    limit: 1,   default: false, null: false
  end

  create_table "receipts", primary_key: "ID", force: :cascade do |t|
    t.string   "Provider",      limit: 255,                   null: false
    t.string   "Pay_Way",       limit: 255,                   null: false
    t.text     "Description",   limit: 65535
    t.datetime "Creation_Time",                               null: false
    t.boolean  "Is_Deleted",    limit: 1,     default: false, null: false
    t.binary   "Image",         limit: 65535
  end

  create_table "receipts_items_costs", primary_key: "receipts_ID", force: :cascade do |t|
    t.string   "Item",           limit: 255, null: false
    t.integer  "Price_Of_Item",  limit: 4
    t.integer  "Quantity",       limit: 4
    t.datetime "Warranty_Start"
    t.datetime "Warranty_End"
  end

  add_index "receipts_items_costs", ["receipts_ID"], name: "Receipts_Item_Cost_FKIndex1", using: :btree

  create_table "roles", primary_key: "ID", force: :cascade do |t|
    t.string   "roles_Name",    limit: 255,                 null: false
    t.datetime "Creation_Time",                             null: false
    t.boolean  "Is_Deleted",    limit: 1,   default: false, null: false
  end

  create_table "user_infos", primary_key: "ID", force: :cascade do |t|
    t.string   "StudentID",         limit: 20
    t.string   "email",             limit: 50,                  null: false
    t.integer  "rolesID",           limit: 4,                   null: false
    t.datetime "Creation_Time",                                 null: false
    t.boolean  "Is_Deleted",        limit: 1,   default: false, null: false
    t.string   "Name",              limit: 255,                 null: false
    t.string   "password_digest",   limit: 255
    t.string   "remember_digest",   limit: 255
    t.boolean  "admin",             limit: 1
    t.string   "activation_digest", limit: 255
    t.boolean  "activated",         limit: 1,   default: false
    t.datetime "activated_at"
  end

  add_index "user_infos", ["rolesID"], name: "User_2_FKIndex1", using: :btree

  add_foreign_key "assigned_projects", "projects", column: "projectsID", primary_key: "ID", name: "assigned_projects_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "assigned_projects", "user_infos", column: "UserID", primary_key: "ID", name: "assigned_projects_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "borrow_return_logs", "items", column: "ItemID", primary_key: "ID", name: "borrow_return_logs_ibfk_2", on_update: :cascade
  add_foreign_key "borrow_return_logs", "items_borrow_status", column: "StatusID", primary_key: "ID", name: "borrow_return_logs_ibfk_3", on_update: :cascade
  add_foreign_key "borrow_return_logs", "user_infos", column: "UserID", primary_key: "ID", name: "borrow_return_logs_ibfk_1", on_update: :cascade
  add_foreign_key "item_contents", "items", column: "Item_ID", primary_key: "ID", name: "item_contents_ibfk_1"
  add_foreign_key "items", "items_borrow_status", column: "_Status", primary_key: "ID", name: "items_ibfk_5", on_update: :cascade
  add_foreign_key "items", "items_types", column: "_Type", primary_key: "ID", name: "items_ibfk_7", on_update: :cascade
  add_foreign_key "items", "locations", column: "locations", primary_key: "ID", name: "items_ibfk_6", on_update: :cascade
  add_foreign_key "items", "projects", column: "Source_project", primary_key: "ID", name: "items_ibfk_8", on_update: :cascade
  add_foreign_key "items", "receipts", column: "ReceiptID", primary_key: "ID", name: "items_ibfk_9", on_update: :cascade
  add_foreign_key "items", "user_infos", column: "Assigned_To", primary_key: "ID", name: "items_ibfk_2", on_update: :cascade, on_delete: :nullify
  add_foreign_key "items", "user_infos", column: "Bought_By", primary_key: "ID", name: "items_ibfk_3", on_update: :cascade
  add_foreign_key "items", "user_infos", column: "Created_by", primary_key: "ID", name: "items_ibfk_1", on_update: :cascade
  add_foreign_key "items", "user_infos", column: "Modified_By", primary_key: "ID", name: "items_ibfk_4", on_update: :cascade
  add_foreign_key "receipts_items_costs", "receipts", column: "receipts_ID", primary_key: "ID", name: "receipts_items_costs_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "user_infos", "roles", column: "rolesID", primary_key: "ID", name: "user_infos_ibfk_1", on_update: :cascade
end
