class AddColumnReleaseIdAndProjectIdToReports < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :release_id, :integer
    add_column :reports, :project_id, :integer
  end
end
