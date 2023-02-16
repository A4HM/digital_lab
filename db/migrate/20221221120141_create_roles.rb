class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.integer :role, default: 0
      t.boolean :needs_approval, default: true
      t.timestamps
    end
  end
end
