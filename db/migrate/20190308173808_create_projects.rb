class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.boolean :active, default: false
      t.timestamps
    end
  end
end
