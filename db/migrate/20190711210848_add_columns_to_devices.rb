class AddColumnsToDevices < ActiveRecord::Migration[5.2]
  def change
    add_column :devices, :os, :string
    add_column :devices, :type, :integer, default: 1
    add_column :devices, :real, :boolean, default: false
    add_column :devices, :telnet, :boolean, default: false
  end
end
