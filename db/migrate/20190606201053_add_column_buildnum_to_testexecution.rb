class AddColumnBuildnumToTestexecution < ActiveRecord::Migration[5.2]
  def change
    add_column :testexecutions, :build_num, :integer
  end
end
