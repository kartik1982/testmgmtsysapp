class AddColumnUiApiToTestcases < ActiveRecord::Migration[5.2]
  def change
    add_column :testcases, :ui, :boolean, default: true
    add_column :testcases, :api, :boolean, default: false
    add_column :testexecutions, :ui, :boolean, default: true
    add_column :testexecutions, :api, :boolean, default: false
  end
end
