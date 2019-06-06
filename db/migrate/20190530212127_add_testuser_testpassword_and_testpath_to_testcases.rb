class AddTestuserTestpasswordAndTestpathToTestcases < ActiveRecord::Migration[5.2]
  def change
    add_column :testcases, :testuser, :string
    add_column :testcases, :testpassword, :string
    add_column :testcases, :testpath, :string
  end
end
