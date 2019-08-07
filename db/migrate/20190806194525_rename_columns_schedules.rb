class RenameColumnsSchedules < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :date, :string
    add_column :schedules, :time, :string
    rename_column :schedules, :browser_name, :browser
    rename_column :schedules, :os_name, :os
  end
end
