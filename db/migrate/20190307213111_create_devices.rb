class CreateDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :devices do |t|
      t.string :title
      t.string :description
      t.boolean :active, default: true
      t.boolean :runmode, default: true
      t.timestamps
    end
  end
end
