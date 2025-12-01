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

ActiveRecord::Schema[8.1].define(version: 2025_12_01_101536) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "matches", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "loser_id", null: false
    t.datetime "played_at"
    t.bigint "player_a_id", null: false
    t.bigint "player_b_id", null: false
    t.string "score"
    t.datetime "updated_at", null: false
    t.bigint "winner_id", null: false
    t.index ["loser_id"], name: "index_matches_on_loser_id"
    t.index ["player_a_id"], name: "index_matches_on_player_a_id"
    t.index ["player_b_id"], name: "index_matches_on_player_b_id"
    t.index ["winner_id"], name: "index_matches_on_winner_id"
  end

  create_table "players", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "losses", default: 0, null: false
    t.string "name", null: false
    t.datetime "updated_at", null: false
    t.integer "wins", default: 0, null: false
  end

  add_foreign_key "matches", "players", column: "loser_id"
  add_foreign_key "matches", "players", column: "player_a_id"
  add_foreign_key "matches", "players", column: "player_b_id"
  add_foreign_key "matches", "players", column: "winner_id"
end
