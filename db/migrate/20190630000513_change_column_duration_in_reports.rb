class ChangeColumnDurationInReports < ActiveRecord::Migration[5.2]
  def change
    change_column :reports, :duration, :float
  end
end
