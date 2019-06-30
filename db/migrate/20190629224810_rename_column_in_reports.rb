class RenameColumnInReports < ActiveRecord::Migration[5.2]
  def change
    rename_column :reports, :testsuite_id, :testsuite_name
    rename_column :reports, :testcase_id, :testcase_name
    rename_column :reports, :release_id, :release_name
    rename_column :reports, :project_id, :project_name
    rename_column :reports, :testcycle_id, :testcycle_name
  end
end
