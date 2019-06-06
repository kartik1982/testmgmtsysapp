class AddColumnsToTestexecution < ActiveRecord::Migration[5.2]
  def change
    add_column :testexecutions, :release_name, :string
    add_column :testexecutions, :testcycle_name, :string
    add_column :testexecutions, :browser, :string
    add_column :testexecutions, :os, :string
    add_column :testexecutions, :testuser, :string
    add_column :testexecutions, :testpassword, :string
    add_column :testexecutions, :testpath, :string
  end
end
