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

ActiveRecord::Schema.define(version: 20160318194549) do

  create_table "chances", force: true do |t|
    t.integer  "user_id"
    t.date     "dob"
    t.boolean  "is_child"
    t.integer  "country_id"
    t.string   "city"
    t.boolean  "confirmed_publication"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "code2"
    t.boolean  "crowdbar_verified",     default: false
    t.boolean  "ignore_double_chance",  default: false
    t.boolean  "remember_data",         default: false
    t.string   "crowdcard_code"
    t.boolean  "confirmed",             default: false
    t.boolean  "mediacoverage",         default: false
    t.string   "phone"
    t.integer  "affiliate"
  end

  add_index "chances", ["code"], name: "code", unique: true, using: :btree
  add_index "chances", ["first_name", "last_name", "dob"], name: "index_chances_on_first_name_and_last_name_and_dob", unique: true, using: :btree
  add_index "chances", ["user_id"], name: "user_id", using: :btree

  create_table "chances_backup", force: true do |t|
    t.integer  "user_id"
    t.date     "dob"
    t.boolean  "is_child"
    t.integer  "country_id"
    t.string   "city"
    t.boolean  "confirmed_publication"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "code2"
    t.boolean  "crowdbar_verified",     default: false
    t.boolean  "ignore_double_chance",  default: false
    t.boolean  "remember_data",         default: false
    t.string   "crowdcard_code"
    t.boolean  "confirmed",             default: false
    t.boolean  "mediacoverage",         default: false
    t.string   "phone"
    t.integer  "affiliate"
  end

  add_index "chances_backup", ["code"], name: "code", unique: true, using: :btree
  add_index "chances_backup", ["first_name", "last_name", "dob"], name: "index_chances_on_first_name_and_last_name_and_dob", unique: true, using: :btree
  add_index "chances_backup", ["user_id"], name: "user_id", using: :btree

  create_table "codes", force: true do |t|
    t.string   "code"
    t.boolean  "used",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "codes", ["code"], name: "unique_code", unique: true, using: :btree

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.text     "text"
    t.string   "static_name"
    t.string   "static_avatar"
    t.string   "name"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id"], name: "commentable_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "crowdbars", force: true do |t|
    t.float    "total_commission",        limit: 24
    t.integer  "referal_count"
    t.float    "seven_day_commission",    limit: 24
    t.integer  "seven_day_referal_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "crowdcards", force: true do |t|
    t.integer  "user_id"
    t.text     "first_name"
    t.text     "last_name"
    t.text     "street"
    t.text     "house_number"
    t.text     "zip_code"
    t.text     "city"
    t.text     "country"
    t.integer  "number_of_cards", default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "sent"
  end

  add_index "crowdcards", ["user_id"], name: "index_crowdcards_on_user_id", using: :btree

  create_table "flags", force: true do |t|
    t.integer  "user_id"
    t.text     "name"
    t.boolean  "value_boolean"
    t.text     "value_text"
    t.integer  "value_integer"
    t.date     "value_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "flags", ["user_id"], name: "user_id", using: :btree

  create_table "notifications", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: true do |t|
    t.string   "user_email"
    t.integer  "user_id"
    t.string   "user_first_name"
    t.string   "user_last_name"
    t.string   "user_street"
    t.string   "user_street_number"
    t.float    "amount_total",               limit: 24
    t.float    "amount_society",             limit: 24
    t.float    "amount_bge",                 limit: 24
    t.boolean  "accept"
    t.string   "account_bank"
    t.string   "account_iban"
    t.string   "account_bic"
    t.boolean  "active",                                default: true
    t.datetime "activated_at"
    t.datetime "paused_at"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "sent_first_notification_at"
    t.string   "user_zip"
    t.string   "user_city"
  end

  add_index "payments", ["user_id"], name: "index_payments_on_user_id", using: :btree
  add_index "payments", ["user_id"], name: "user_id", using: :btree

  create_table "payments_bak", force: true do |t|
    t.string   "user_email"
    t.integer  "user_id"
    t.string   "user_first_name"
    t.string   "user_last_name"
    t.string   "user_street"
    t.string   "user_street_number"
    t.float    "amount_total",               limit: 24
    t.float    "amount_society",             limit: 24
    t.float    "amount_bge",                 limit: 24
    t.boolean  "accept"
    t.string   "account_bank"
    t.string   "account_iban"
    t.string   "account_bic"
    t.boolean  "active",                                default: true
    t.datetime "activated_at"
    t.datetime "paused_at"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "sent_first_notification_at"
    t.string   "user_zip"
    t.string   "user_city"
  end

  add_index "payments_bak", ["user_id"], name: "user_id", using: :btree

  create_table "payments_bak2", force: true do |t|
    t.string   "user_email"
    t.integer  "user_id"
    t.string   "user_first_name"
    t.string   "user_last_name"
    t.string   "user_street"
    t.string   "user_street_number"
    t.float    "amount_total",               limit: 24
    t.float    "amount_society",             limit: 24
    t.float    "amount_bge",                 limit: 24
    t.boolean  "accept"
    t.string   "account_bank"
    t.string   "account_iban"
    t.string   "account_bic"
    t.boolean  "active",                                default: true
    t.datetime "activated_at"
    t.datetime "paused_at"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "sent_first_notification_at"
    t.string   "user_zip"
    t.string   "user_city"
  end

  add_index "payments_bak2", ["user_id"], name: "user_id", using: :btree

  create_table "questions", force: true do |t|
    t.string   "text"
    t.text     "answer"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "votes",      default: 1
  end

  create_table "settings", force: true do |t|
    t.string   "name"
    t.boolean  "value",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "state_users", force: true do |t|
    t.text     "story"
    t.integer  "user_id"
    t.integer  "state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "visibility", default: false
  end

  add_index "state_users", ["state_id"], name: "index_state_users_on_state_id", using: :btree
  add_index "state_users", ["user_id"], name: "user_id", using: :btree

  create_table "states", force: true do |t|
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suggestions", force: true do |t|
    t.string   "email"
    t.text     "initial_wishes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "suggestions", ["email"], name: "email8", length: {"email"=>8}, using: :btree

  create_table "support_debug", force: true do |t|
    t.string   "nickname"
    t.string   "email"
    t.string   "firstname"
    t.string   "lastname"
    t.float    "amount_total",      limit: 24
    t.float    "amount_internal",   limit: 24
    t.float    "amount_for_income", limit: 24
    t.string   "company"
    t.string   "street"
    t.string   "zip"
    t.string   "city"
    t.string   "country"
    t.string   "payment_method"
    t.boolean  "payment_completed"
    t.text     "comment"
    t.boolean  "anonymous"
    t.boolean  "recurring"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "supports", force: true do |t|
    t.string   "nickname"
    t.string   "email"
    t.string   "firstname"
    t.string   "lastname"
    t.float    "amount_total",      limit: 24
    t.float    "amount_internal",   limit: 24
    t.float    "amount_for_income", limit: 24
    t.string   "company"
    t.string   "street"
    t.string   "zip"
    t.string   "city"
    t.string   "country"
    t.string   "payment_method"
    t.boolean  "payment_completed"
    t.text     "comment"
    t.boolean  "anonymous"
    t.boolean  "recurring"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "tweeted"
  end

  add_index "supports", ["user_id"], name: "index_supports_on_user_id", using: :btree

  create_table "supports_backup", force: true do |t|
    t.string   "nickname"
    t.string   "email"
    t.string   "firstname"
    t.string   "lastname"
    t.float    "amount_total",      limit: 24
    t.float    "amount_internal",   limit: 24
    t.float    "amount_for_income", limit: 24
    t.string   "company"
    t.string   "street"
    t.string   "zip"
    t.string   "city"
    t.string   "country"
    t.string   "payment_method"
    t.boolean  "payment_completed"
    t.text     "comment"
    t.boolean  "anonymous"
    t.boolean  "recurring"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "supports_bak", force: true do |t|
    t.string   "nickname"
    t.string   "email"
    t.string   "firstname"
    t.string   "lastname"
    t.float    "amount_total",      limit: 24
    t.float    "amount_internal",   limit: 24
    t.float    "amount_for_income", limit: 24
    t.string   "company"
    t.string   "street"
    t.string   "zip"
    t.string   "city"
    t.string   "country"
    t.string   "payment_method"
    t.boolean  "payment_completed"
    t.text     "comment"
    t.boolean  "anonymous"
    t.boolean  "recurring"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "supports_bak2", force: true do |t|
    t.string   "nickname"
    t.string   "email"
    t.string   "firstname"
    t.string   "lastname"
    t.float    "amount_total",      limit: 24
    t.float    "amount_internal",   limit: 24
    t.float    "amount_for_income", limit: 24
    t.string   "company"
    t.string   "street"
    t.string   "zip"
    t.string   "city"
    t.string   "country"
    t.string   "payment_method"
    t.boolean  "payment_completed"
    t.text     "comment"
    t.boolean  "anonymous"
    t.boolean  "recurring"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "tandems", force: true do |t|
    t.integer  "inviter_id"
    t.integer  "invitee_id"
    t.string   "invitee_name"
    t.string   "invitee_email"
    t.string   "invitation_token"
    t.datetime "invitation_accepted_at"
    t.string   "purpose"
    t.boolean  "invitee_participates"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "invitation_type"
    t.integer  "disabled_by"
    t.text     "invitee_email_subject"
    t.text     "invitee_email_text"
    t.datetime "invitee_email_sent"
    t.text     "inviter_grudges_invitee_for"
    t.text     "invitee_grudges_inviter_for"
    t.string   "inviter_code"
    t.string   "invitee_code"
  end

  add_index "tandems", ["invitation_token"], name: "index_tandems_on_invitation_token", unique: true, using: :btree
  add_index "tandems", ["invitee_id"], name: "invitee_id", using: :btree
  add_index "tandems", ["inviter_id"], name: "inviter_id", using: :btree

  create_table "tandems_backup", force: true do |t|
    t.integer  "inviter_id"
    t.integer  "invitee_id"
    t.string   "invitee_name"
    t.string   "invitee_email"
    t.string   "invitation_token"
    t.datetime "invitation_accepted_at"
    t.string   "purpose"
    t.boolean  "invitee_participates"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "invitation_type"
    t.integer  "disabled_by"
    t.text     "invitee_email_subject"
    t.text     "invitee_email_text"
    t.datetime "invitee_email_sent"
    t.text     "inviter_grudges_invitee_for"
    t.text     "invitee_grudges_inviter_for"
    t.string   "inviter_code"
    t.string   "invitee_code"
  end

  add_index "tandems_backup", ["invitation_token"], name: "index_tandems_on_invitation_token", unique: true, using: :btree
  add_index "tandems_backup", ["invitee_id"], name: "invitee_id", using: :btree
  add_index "tandems_backup", ["inviter_id"], name: "inviter_id", using: :btree

  create_table "todos", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_wishes", force: true do |t|
    t.text     "story"
    t.integer  "user_id"
    t.integer  "wish_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_wishes", ["created_at"], name: "created_at", using: :btree
  add_index "user_wishes", ["user_id"], name: "user_id", using: :btree
  add_index "user_wishes", ["wish_id"], name: "wish_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "name",                   default: "",    null: false
    t.string   "initial_wishes",         default: ""
    t.string   "initial_conditions",     default: ""
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar"
    t.boolean  "datenschutz",            default: false
    t.boolean  "newsletter",             default: false
    t.boolean  "has_crowdbar",           default: false
    t.string   "browser"
    t.string   "os"
    t.boolean  "crowdbar_not_found",     default: false
    t.integer  "winner",                 default: 0
    t.boolean  "admin",                  default: false
    t.boolean  "veganz",                 default: false
  end

  add_index "users", ["avatar"], name: "index_users_on_avatar", using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_bak", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "name",                   default: "",    null: false
    t.string   "initial_wishes",         default: ""
    t.string   "initial_conditions",     default: ""
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar"
    t.boolean  "datenschutz",            default: false
    t.boolean  "newsletter",             default: false
    t.boolean  "has_crowdbar",           default: false
    t.string   "browser"
    t.string   "os"
    t.boolean  "crowdbar_not_found",     default: false
    t.integer  "winner",                 default: 0
    t.boolean  "admin",                  default: false
    t.boolean  "veganz",                 default: false
  end

  add_index "users_bak", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users_bak", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users_bak", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_bak2", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "name",                   default: "",    null: false
    t.string   "initial_wishes",         default: ""
    t.string   "initial_conditions",     default: ""
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar"
    t.boolean  "datenschutz",            default: false
    t.boolean  "newsletter",             default: false
    t.boolean  "has_crowdbar",           default: false
    t.string   "browser"
    t.string   "os"
    t.boolean  "crowdbar_not_found",     default: false
    t.integer  "winner",                 default: 0
    t.boolean  "admin",                  default: false
    t.boolean  "veganz",                 default: false
  end

  add_index "users_bak2", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users_bak2", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users_bak2", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_november", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "name",                   default: "",    null: false
    t.string   "initial_wishes",         default: ""
    t.string   "initial_conditions",     default: ""
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar"
    t.boolean  "datenschutz",            default: false
    t.boolean  "newsletter",             default: false
    t.boolean  "has_crowdbar",           default: false
    t.string   "browser"
    t.string   "os"
    t.boolean  "crowdbar_not_found",     default: false
  end

  add_index "users_november", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users_november", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users_november", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "wishes", force: true do |t|
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wishes", ["text"], name: "text12", length: {"text"=>12}, using: :btree

end
