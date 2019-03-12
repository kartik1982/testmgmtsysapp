class AddColumnActiveToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :active, :boolean, default: true
  end
end
