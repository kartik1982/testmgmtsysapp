class AddColumnCreatedByUpdatedByToTestcases < ActiveRecord::Migration[5.2]
  def change
    add_column :testcases, :created_by, :string
    add_column :testcases, :updated_by, :string
    add_column :testsuites, :created_by, :string
    add_column :testsuites, :updated_by, :string
  end
end
