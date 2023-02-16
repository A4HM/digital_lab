class RenameEditorsUsernameColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :editors, :username, :email
  end
end
