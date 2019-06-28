class AddSequenceToTestsuite < ActiveRecord::Migration[5.2]
  def change
    add_column :testsuites, :sequence, :text, array: true
  end
end
