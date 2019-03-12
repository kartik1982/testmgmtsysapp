class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.integer :pass, default: 0
      t.integer :fail, default: 0
      t.integer :pending, default: 0
      t.datetime :start_at
      t.datetime :end_at
      t.text :description
      t.string :log_path
      t.timestamps
    end
  end
end
