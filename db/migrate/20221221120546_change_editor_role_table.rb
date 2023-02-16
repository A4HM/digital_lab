class ChangeEditorRoleTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :editor_roles, :role
    remove_column :editor_roles, :needs_approval
    add_reference :editor_roles, :role, foreign_key: true
  end

end
