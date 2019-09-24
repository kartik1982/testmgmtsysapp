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

ActiveRecord::Schema.define(version: 2019_09_23_232530) do

  create_table "devices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.boolean "active", default: true
    t.boolean "runmode", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "serial"
    t.string "os"
    t.string "device_type", default: "1"
    t.boolean "device_real", default: false
    t.boolean "device_telnet", default: false
  end

  create_table "groups", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
  end

  create_table "project_testcycles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "testcycle_id"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.boolean "active", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "updated_by"
  end

  create_table "release_projects", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "release_id"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "releases", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.boolean "active", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "updated_by"
  end

  create_table "reports", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "pass", default: 0
    t.integer "fail", default: 0
    t.integer "pending", default: 0
    t.datetime "start_at"
    t.datetime "end_at"
    t.string "comment", default: "Add comment"
    t.string "log_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "testsuite_name"
    t.string "testcase_name"
    t.string "release_name"
    t.string "project_name"
    t.string "build"
    t.string "testcycle_name"
    t.string "testuser"
    t.string "testpassword"
    t.string "testpath"
    t.string "os"
    t.string "browser"
    t.string "array_serial", default: "none"
    t.float "duration"
  end

  create_table "schedules", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "job_name"
    t.string "worker_name"
    t.string "release_name"
    t.string "testcycle_name"
    t.string "testsuite_name"
    t.string "testcase_name"
    t.string "browser"
    t.string "os"
    t.string "schedule_cron"
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "date"
    t.string "time"
    t.text "days"
    t.boolean "everyselected_days", default: false
  end

  create_table "testcases", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.boolean "runmode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "testsuite_id"
    t.integer "user_id"
    t.string "created_by"
    t.string "updated_by"
    t.string "testuser"
    t.string "testpassword"
    t.string "testpath"
    t.string "array_serial"
    t.boolean "ui", default: true
    t.boolean "api", default: false
  end

  create_table "testcycles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.boolean "active", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "updated_by"
  end

  create_table "testexecutions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "testsuite_name"
    t.string "testcase_name"
    t.integer "runstatus"
    t.text "runlog", limit: 4294967295
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "release_name"
    t.string "testcycle_name"
    t.string "browser"
    t.string "os"
    t.string "testuser"
    t.string "testpassword"
    t.string "testpath"
    t.integer "build_num"
    t.boolean "ui", default: true
    t.boolean "api", default: false
  end

  create_table "testsuites", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.boolean "runmode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "created_by"
    t.string "updated_by"
    t.text "sequence"
    t.string "comment", default: "Add Comment"
    t.integer "project_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.boolean "admin", default: false
    t.boolean "super_admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "token"
    t.index ["token"], name: "index_users_on_token", unique: true
  end

end
