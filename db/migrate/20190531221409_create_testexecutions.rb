class CreateTestexecutions < ActiveRecord::Migration[5.2]
  def change
    create_table :testexecutions do |t|
      t.string :testsuite_name
      t.string :testcase_name
      t.integer :runstatus
      t.text :runlog, limit: 4294967295
      t.timestamps
    end
  end
end
