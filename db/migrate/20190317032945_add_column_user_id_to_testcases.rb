class AddColumnUserIdToTestcases < ActiveRecord::Migration[5.2]
  def change
    add_column :testcases, :user_id, :integer
    add_column :testsuites, :user_id, :integer
    add_column :projects, :user_id, :integer
    add_column :releases, :user_id, :integer
    add_column :testcycles, :user_id, :integer
  end
end
