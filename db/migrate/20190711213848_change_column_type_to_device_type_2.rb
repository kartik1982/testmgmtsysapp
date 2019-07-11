class ChangeColumnTypeToDeviceType2 < ActiveRecord::Migration[5.2]
  def change
    change_column :devices, :device_type, :string
  end
end
