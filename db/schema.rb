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

ActiveRecord::Schema.define(version: 20_211_231_083_836) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'games', force: :cascade do |t|
    t.string   'title'
    t.datetime 'begin_date'
    t.datetime 'end_date'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'players', force: :cascade do |t|
    t.string   'f_name'
    t.string   'l_name'
    t.datetime 'join_date'
    t.string   'contact'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'scores', force: :cascade do |t|
    t.integer  'points'
    t.string   'status'
    t.integer  'player_id'
    t.integer  'game_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['game_id'], name: 'index_scores_on_game_id', using: :btree
    t.index ['player_id'], name: 'index_scores_on_player_id', using: :btree
  end

  add_foreign_key 'scores', 'games'
  add_foreign_key 'scores', 'players'
end
