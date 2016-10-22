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

ActiveRecord::Schema.define(version: 20161022161030) do

  create_table "boards", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cells", force: :cascade do |t|
    t.string   "type"
    t.string   "name",        null: false
    t.text     "instruction"
    t.integer  "cell_id"
    t.integer  "turn"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "board_id"
    t.index ["board_id"], name: "index_cells_on_board_id"
    t.index ["cell_id"], name: "index_cells_on_cell_id"
  end

  create_table "games", force: :cascade do |t|
    t.integer  "board_id"
    t.integer  "player_id"
    t.integer  "turn",       default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["board_id"], name: "index_games_on_board_id"
    t.index ["player_id"], name: "index_games_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string   "name",                   null: false
    t.integer  "cell_id"
    t.integer  "turn",       default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "game_id"
    t.index ["cell_id"], name: "index_players_on_cell_id"
    t.index ["game_id"], name: "index_players_on_game_id"
  end

end
