class ChangeTablesNames < ActiveRecord::Migration[7.0]
  def change
    drop_table :labels_types
  end
end
