class AddColumnCommentToTestsuites < ActiveRecord::Migration[5.2]
  def change
    add_column :testsuites, :comment, :string, default: "Add Comment"
  end
end
