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

ActiveRecord::Schema[7.1].define(version: 2024_04_13_044345) do
  create_table "earthquakes", force: :cascade do |t|
    t.string "external_id"
    t.string "kind"
    t.decimal "magnitude"
    t.string "place"
    t.string "time"
    t.boolean "tsunami"
    t.string "mag_type"
    t.string "title"
    t.decimal "longitude"
    t.decimal "latitude"
    t.string "external_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["external_id"], name: "index_earthquakes_on_external_id", unique: true
  end

end
