class ChangeColumnTypeToDeviceType < ActiveRecord::Migration[5.2]
  def change
    rename_column :devices, :type, :device_type
    rename_column :devices, :real, :device_real
    rename_column :devices, :telnet, :device_telnet
  end
end
