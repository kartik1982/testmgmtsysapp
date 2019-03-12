class ChangeColumnDescriptionToComment < ActiveRecord::Migration[5.2]
  def change
    rename_column :reports, :description, :comment
  end
end
