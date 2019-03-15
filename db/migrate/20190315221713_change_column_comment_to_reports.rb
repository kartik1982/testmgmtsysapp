class ChangeColumnCommentToReports < ActiveRecord::Migration[5.2]
  def change
    change_column :reports, :comment, :string, default: "Add comment"
  end
end
