class CreateTestcases < ActiveRecord::Migration[5.2]
  def change
    create_table :testcases do |t|
      t.string :title
      t.string :description
      t.boolean :runmode
      t.timestamps
    end
  end
end
