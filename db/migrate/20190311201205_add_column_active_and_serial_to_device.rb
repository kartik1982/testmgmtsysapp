class AddColumnActiveAndSerialToDevice < ActiveRecord::Migration[5.2]
  def change
    add_column :devices, :serial, :string
  end
end
