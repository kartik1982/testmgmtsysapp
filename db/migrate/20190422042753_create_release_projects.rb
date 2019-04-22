class CreateReleaseProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :release_projects do |t|
      t.integer :release_id
      t.integer :project_id
      t.timestamps
    end
  end
end
