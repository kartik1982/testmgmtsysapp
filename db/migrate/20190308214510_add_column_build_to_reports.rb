class AddColumnBuildToReports < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :build, :string
  end
end
