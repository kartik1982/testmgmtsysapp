class AddColumnEveryselecteddaysSchedules < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :everyselected_days, :boolean, default: false
  end
end
