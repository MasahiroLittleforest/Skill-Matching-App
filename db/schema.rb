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

ActiveRecord::Schema.define(version: 2019_07_21_053712) do

  create_table "applikations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "teacher_id"
    t.datetime "appointment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_applikations_on_student_id"
    t.index ["teacher_id"], name: "index_applikations_on_teacher_id"
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "certifications", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "teacher_id"
    t.string "name"
    t.date "date_of_acquisition"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_certifications_on_teacher_id"
  end

  create_table "chat_rooms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "teacher_id"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_chat_rooms_on_student_id"
    t.index ["teacher_id"], name: "index_chat_rooms_on_teacher_id"
  end

  create_table "experiences", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "teacher_id"
    t.string "title"
    t.string "description"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_experiences_on_teacher_id"
  end

  create_table "matches", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_matches_on_student_id"
    t.index ["teacher_id"], name: "index_matches_on_teacher_id"
  end

  create_table "prefectures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "level"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_skills_on_user_id"
  end

  create_table "students", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "bio"
    t.float "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "students_preferences", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "category_id"
    t.bigint "skill_id"
    t.float "teachers_rate"
    t.integer "min_age"
    t.integer "max_age"
    t.string "gender"
    t.bigint "prefecture_id"
    t.time "lesson_time"
    t.decimal "price", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_students_preferences_on_category_id"
    t.index ["prefecture_id"], name: "index_students_preferences_on_prefecture_id"
    t.index ["skill_id"], name: "index_students_preferences_on_skill_id"
    t.index ["student_id"], name: "index_students_preferences_on_student_id"
  end

  create_table "teachers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "bio"
    t.float "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_teachers_on_user_id"
  end

  create_table "teachers_preferences", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "teacher_id"
    t.float "students_rate"
    t.integer "min_age"
    t.integer "max_age"
    t.string "gender"
    t.bigint "prefecture_id"
    t.time "lesson_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prefecture_id"], name: "index_teachers_preferences_on_prefecture_id"
    t.index ["teacher_id"], name: "index_teachers_preferences_on_teacher_id"
  end

  create_table "user_relationships", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "follow_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follow_id"], name: "index_user_relationships_on_follow_id"
    t.index ["user_id", "follow_id"], name: "index_user_relationships_on_user_id_and_follow_id", unique: true
    t.index ["user_id"], name: "index_user_relationships_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "real_name"
    t.string "user_name"
    t.string "image"
    t.integer "age"
    t.integer "gender", default: 0, null: false
    t.string "profession"
    t.string "bio"
    t.date "birthday"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "applikations", "students"
  add_foreign_key "applikations", "teachers"
  add_foreign_key "certifications", "teachers"
  add_foreign_key "chat_rooms", "students"
  add_foreign_key "chat_rooms", "teachers"
  add_foreign_key "experiences", "teachers"
  add_foreign_key "matches", "students"
  add_foreign_key "matches", "teachers"
  add_foreign_key "skills", "users"
  add_foreign_key "students", "users"
  add_foreign_key "students_preferences", "students"
  add_foreign_key "teachers", "users"
  add_foreign_key "teachers_preferences", "teachers"
  add_foreign_key "user_relationships", "users"
  add_foreign_key "user_relationships", "users", column: "follow_id"
end
