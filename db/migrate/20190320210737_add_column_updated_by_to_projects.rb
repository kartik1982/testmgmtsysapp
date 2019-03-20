class AddColumnUpdatedByToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :updated_by, :string
    add_column :releases, :updated_by, :string
    add_column :testcycles, :updated_by, :string
  end
end
