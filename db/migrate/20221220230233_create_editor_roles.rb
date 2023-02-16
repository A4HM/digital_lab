class CreateEditorRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :editor_roles do |t|
      t.belongs_to :editor, index: true, foreign_key: true
      t.integer :role, default: 0
      t.boolean :needs_approval, default: true
      t.timestamps
    end
  end
end
