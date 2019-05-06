class CreateProjectTestcycles < ActiveRecord::Migration[5.2]
  def change
    create_table :project_testcycles do |t|
      t.integer :testcycle_id
      t.integer :project_id
      t.timestamps
    end
  end
end
