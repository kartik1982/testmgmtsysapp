class AddTestsuiteIdToTestcases < ActiveRecord::Migration[5.2]
  def change
    add_column :testcases, :testsuite_id, :integer
  end
end
