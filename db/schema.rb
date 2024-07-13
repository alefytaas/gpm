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

ActiveRecord::Schema[7.1].define(version: 2024_07_13_132052) do
  create_table "escala_users", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "escala_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["escala_id"], name: "index_escala_users_on_escala_id"
    t.index ["user_id"], name: "index_escala_users_on_user_id"
  end

  create_table "escalas", force: :cascade do |t|
    t.integer "id_medico_adm"
    t.string "setor"
    t.date "mes_ref"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "id_medicos"
    t.integer "medicos"
    t.string "array"
    t.string "true"
  end

  create_table "jornadas", force: :cascade do |t|
    t.date "data"
    t.string "turno"
    t.integer "user_id", null: false
    t.integer "escala_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["escala_id"], name: "index_jornadas_on_escala_id"
    t.index ["user_id"], name: "index_jornadas_on_user_id"
  end

  create_table "shift_swaps", force: :cascade do |t|
    t.integer "requesting_doctor_id", null: false
    t.integer "receiving_doctor_id", null: false
    t.integer "jornada_id", null: false
    t.string "status", default: "pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "jornada_id_destination"
    t.index ["jornada_id"], name: "index_shift_swaps_on_jornada_id"
    t.index ["jornada_id_destination"], name: "index_shift_swaps_on_jornada_id_destination"
    t.index ["receiving_doctor_id"], name: "index_shift_swaps_on_receiving_doctor_id"
    t.index ["requesting_doctor_id"], name: "index_shift_swaps_on_requesting_doctor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.date "dt_nasc"
    t.string "user_type"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "image"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "escala_users", "escalas"
  add_foreign_key "escala_users", "users"
  add_foreign_key "jornadas", "escalas"
  add_foreign_key "jornadas", "users"
  add_foreign_key "shift_swaps", "jornadas"
  add_foreign_key "shift_swaps", "users", column: "receiving_doctor_id"
  add_foreign_key "shift_swaps", "users", column: "requesting_doctor_id"
end
