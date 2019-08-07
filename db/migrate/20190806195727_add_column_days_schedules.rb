class AddColumnDaysSchedules < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :days, :text, array: true
  end
end
