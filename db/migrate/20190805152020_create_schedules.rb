class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.string :job_name
      t.string :worker_name
      t.string :release_name
      t.string :testcycle_name
      t.string :testsuite_name
      t.string :testcase_name
      t.string :browser_name
      t.string :os_name
      t.string :schedule_cron
      t.boolean :status, default: true
      t.timestamps
    end
  end
end
