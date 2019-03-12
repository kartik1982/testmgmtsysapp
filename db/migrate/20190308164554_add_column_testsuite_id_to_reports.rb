class AddColumnTestsuiteIdToReports < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :testsuite_id, :integer
    add_column :reports, :testcase_id, :integer
  end
end
