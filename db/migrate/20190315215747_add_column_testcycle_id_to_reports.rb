class AddColumnTestcycleIdToReports < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :testcycle_id, :integer
  end
end
