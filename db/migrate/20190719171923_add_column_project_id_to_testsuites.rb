class AddColumnProjectIdToTestsuites < ActiveRecord::Migration[5.2]
  def change
    add_column :testsuites, :project_id, :integer
  end
end
