class AddAdminToEditor < ActiveRecord::Migration[7.0]
  def change
    add_column :editors, :admin, :boolean, default: false
  end
end
