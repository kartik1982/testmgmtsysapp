class AddColumnApSerialToTestcases < ActiveRecord::Migration[5.2]
  def change
    add_column :testcases, :array_serial, :string
  end
end
