class ChangeColumnInReports < ActiveRecord::Migration[5.2]
  def change
    change_column :reports, :testsuite_name, :string
    change_column :reports, :testcase_name, :string
    change_column :reports, :release_name, :string
    change_column :reports, :project_name, :string
    change_column :reports, :testcycle_name, :string
    add_column :reports, :testuser, :string
    add_column :reports, :testpassword, :string
    add_column :reports, :testpath, :string
    add_column :reports, :os, :string
    add_column :reports, :browser, :string
    add_column :reports, :array_serial, :string, default: 'none'
    add_column :reports, :duration, :integer
  end
end
